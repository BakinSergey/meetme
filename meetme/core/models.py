import datetime
from os import path

from django.db import models
from django.utils import timezone

from django.contrib.auth.models import AbstractUser
from django.contrib.postgres.fields import JSONField, ArrayField

# from config2.core import utils


# Create your models here.
from django.utils.safestring import mark_safe


class MeetUser(AbstractUser):
    class Meta:
        verbose_name = 'Пользователь'
        verbose_name_plural = 'Пользователи'

    NOT = 'empty'
    MALE = 'male'
    FEMALE = 'female'

    SEX = (
        (NOT, 'Не указан'),
        (MALE, 'Мужской'),
        (FEMALE, 'Женский'),
    )

    sex = models.CharField(max_length=6, choices=SEX, default='empty', verbose_name='Пол')
    is_subscriber = models.BooleanField(default=False, verbose_name='Is news subscriber')

    avatar = models.ImageField(max_length=127, verbose_name='Фото профиля',
                               upload_to=path.join('user', 'logo'), default='./user/logo/default.png')

    # sympathy users ID
    symp_with = ArrayField(models.IntegerField(), default=list, blank=True, verbose_name='Sympathy with')

    # unsympathy users ID
    unsymp_with = ArrayField(models.IntegerField(), default=list, blank=True, verbose_name='UnSympathy with')

    liked_activities = ArrayField(models.IntegerField(), default=list, blank=True, verbose_name='liked activities')
    liked_actual_events = ArrayField(models.IntegerField(), default=list, blank=True,
                                     verbose_name='liked actual events')
    liked_recent_events = ArrayField(models.IntegerField(), default=list, blank=True,
                                     verbose_name='liked recent events')

    # актуализируем списки лайков у нейтральных
    def actualize_ea(self, neitrals):
        actual_events = Event.actual_events_id()
        actual_activities = Activity.actual_activities_id()
        for u in neitrals:
            nonactual_activities = [a for a in u.liked_activities if a not in actual_activities]
            passed_events = [e for e in u.liked_actual_events if e not in actual_events]
            u.actualize_activities(nonactual_activities)
            u.archive_events(passed_events)

    @property
    def likeme_list(self):
        # выполняем для всех НЕЙТРАЛЬНЫХ пользователей актуализацию событий и активностей:
        # у каждого юзера в списках:
        # liked_activities оставляем только те к-е is_active
        # liked_actual_events оставляем только те к-е есть в Event.current_events.all()
        # после чего ищем тех юзеров у к-х списки после фильтрации будут СУПЕРСПИСКАМИ
        # для аналогичных списков нашего бро
        ntrs = self.neitral_list.all()
        self.actualize_ea(ntrs)
        likeme = [u.pk for u in ntrs if set(self.liked_actual_events).issubset(set(u.liked_actual_events))
                  and set(self.liked_activities).issubset(set(u.liked_activities))]

        # except myself
        likeme.remove(self.pk)

        user_likeme = MeetUser.objects.get_queryset().filter(pk__in=likeme)
        return user_likeme

    @property
    def positive_list(self):
        friends = MeetUser.objects.get_queryset().filter(pk__in=self.symp_with)
        return friends

    @property
    def cross_positive_list(self):
        cross_friends = self.positive_list.filter(symp_with__contains=[self.pk])
        return cross_friends

    @property
    def negative_list(self):
        nonfriends = MeetUser.objects.get_queryset().filter(pk__in=self.unsymp_with)
        return nonfriends

    @property
    def cross_negative_list(self):
        cross_nonfriends = self.negative_list.filter(unsymp_with__contains=[self.pk])
        return cross_nonfriends

    @property
    def neitral_list(self):
        incedence = self.unsymp_with + self.symp_with
        neitrals = MeetUser.objects.get_queryset().exclude(pk__in=incedence)
        return neitrals

    # симпатизировать юзера   == сделать positive
    def symp_user(self, user_id):
        self.symp_with.append(user_id)
        self.save()

    # от-симпатизировать юзера == сделать из positive -> neitral
    def unsymp_user(self, user_id):
        self.symp_with.remove(user_id)
        self.save()

    # игнорить юзера == сделать negative
    def ignore_user(self, user_id):
        self.unsymp_with.append(user_id)
        self.save()

    # вернуть юзера == сделать из negative -> neitral
    def restore_user(self, user_id):
        self.unsymp_with.remove(user_id)
        self.save()

    # лайк активности
    def like_activity(self, act_id):
        self.liked_activities.append(act_id)
        self.save()

    # анлайк активности
    def unlike_activity(self, act_id):
        self.liked_activities.remove(act_id)
        self.save()

    # лайк событию
    def like_event(self, e_id):
        self.liked_actual_events.append(e_id)
        self.save()

    # анлайк событию
    def unlike_event(self, e_id):
        self.liked_actual_events.remove(e_id)
        self.save()

    # событие в архив
    def archive_events(self, e_ids):
        for e_id in e_ids:
            self.liked_actual_events.remove(e_id)
            self.liked_recent_events.append(e_id)
        self.liked_actual_events.sort()
        self.save()

    # удаляем неактуальные активности
    def actualize_activities(self, a_ids):
        for a_id in a_ids:
            self.liked_activities.remove(a_id)
        self.liked_activities.sort()
        self.save()


class EventCategory(models.Model):
    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'

    OTHER = 'other'
    SPORT = 'sport'
    EDUCATION = 'education'
    VOLONTEER = 'volonteer'
    RELAX = 'relax'
    POLITIC = 'politic'

    E_TYPES = (
        (OTHER, 'Другое'),
        (SPORT, 'Спорт'),
        (EDUCATION, 'Образование'),
        (VOLONTEER, 'Волонтерство'),
        (RELAX, 'Отдых'),
        (POLITIC, 'Политика'),
    )

    name = models.CharField(choices=E_TYPES, max_length=30, blank=False, unique=True, verbose_name='Название')

    def __str__(self):
        return self.name


class ActualActivityManager(models.Manager):
    def get_queryset(self):
        return super(ActualActivityManager, self).get_queryset().filter(is_active=True)


class Activity(models.Model):
    class Meta:
        verbose_name = 'Активность'
        verbose_name_plural = 'Активности'

    name = models.CharField(max_length=30, blank=False, default='Флэшмоб', unique=True, verbose_name='Название')

    category = models.ForeignKey(EventCategory, on_delete=models.CASCADE,
                                 verbose_name='Категория события', db_index=True, default='other')

    is_active = models.BooleanField(default=True, verbose_name='Показывать пользователям ?', db_index=True)

    objects = models.Manager()  # The default manager.

    current_activities = ActualActivityManager()  # only active activities
    image = models.ImageField(max_length=127, verbose_name='Активность, изображение',
                              upload_to=path.join('activity', 'image'), default='./activity/image/default_activity.jpg')

    @staticmethod
    def actual_activities_id():
        return [a.pk for a in Activity.current_activities.all()]


class ActualEventManager(models.Manager):
    def get_queryset(self):
        hurry_time = timezone.timedelta(hours=2)
        now_time = timezone.now()
        # print(f'now+hurry:{now_time + hurry_time}')

        return super(ActualEventManager, self).get_queryset().filter(dt__gte=now_time + hurry_time, is_active=True)


class Event(models.Model):
    class Meta:
        verbose_name = 'Событие'
        verbose_name_plural = 'События'

        unique_together = ('name', 'dt',)

    today = timezone.now

    name = models.CharField(verbose_name='Название', max_length=30, blank=False, default='Сабантуй')

    category = models.ForeignKey(EventCategory, on_delete=models.CASCADE,
                                 verbose_name='Категория события', db_index=True, default='other')

    dt = models.DateTimeField(blank=False, verbose_name='Дата и время события', default=today)

    is_active = models.BooleanField(default=True, verbose_name='Показывать пользователям ?', db_index=True)

    objects = models.Manager()

    current_events = ActualEventManager()

    image = models.ImageField(max_length=127, verbose_name='Событие, изображение',
                              upload_to=path.join('event', 'image'), default='./event/image/default_event.jpg')


    @staticmethod
    def actual_events_id():
        return [e.pk for e in Event.current_events.all()]

# class EventChoice(models.Model):
#     user = models.ForeignKey(MeetUser, on_delete=models.SET_NULL)
#     event = models.ForeignKey(Event, on_delete=models.SET_NULL)


# class ActivityChoice(models.Model):
#     user = models.ForeignKey(MeetUser, on_delete=models.SET_NULL)
#     activity = models.ForeignKey(Activity, on_delete=models.SET_NULL)
