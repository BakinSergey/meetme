import json

from django.conf.urls import url, include
from django.urls import path
from django.conf import settings
from django.core.cache import cache

from rest_framework import generics, viewsets, serializers, status
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.generics import get_object_or_404, UpdateAPIView, CreateAPIView, RetrieveAPIView
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from rest_framework.routers import DefaultRouter
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token

from core.serializers import EASerializer, MeetUserSerializer, ChangePasswordSerializer, \
    EventLikeSerializer, ActivityLikeSerializer, UserSympSerializer, UserHateSerializer, UserRelationSerializer

from core.models import MeetUser


class UserRelationViewSet(viewsets.GenericViewSet):
    """
user_likeme_list:
## Получить список пользователей отметивших те же события и активности ##
сравнение идет по спискам: активных событий(к-е еще не прошли) И активным активностям.

user_positive_list:
## Получить список пользователей симпатичных авторизованному пользователю ##

user_cross_positive_list:
## Получить список пользователей взаимно симпатичных авторизованному пользователю ##

user_negative_list:
## Получить список пользователей НЕ симпатичных авторизованному пользователю ##

user_cross_negative_list:
## Получить список пользователей взаимно НЕ симпатичных авторизованному пользователю ##

user_neitral_list:
## Получить список пользователей нейтральных авторизованному пользователю ##


"""
    serializer_classes = {
        'user_likeme_list': UserRelationSerializer,
        'user_positive_list': UserRelationSerializer,
        'user_cross_positive_list': UserRelationSerializer,
        'user_negative_list': UserRelationSerializer,
        'user_cross_negative_list': UserRelationSerializer,
        'user_neitral_list': UserRelationSerializer,
    }

    @action(detail=False, methods=['get'], permission_classes=(IsAuthenticated,))
    def user_likeme_list(self, request, *args, **kwargs):
        result = self.get_result(request, action='likeme_list')
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], permission_classes=(IsAuthenticated,))
    def user_positive_list(self, request, *args, **kwargs):
        result = self.get_result(request, action='positive_list')
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], permission_classes=(IsAuthenticated,))
    def user_cross_positive_list(self, request, *args, **kwargs):
        result = self.get_result(request, action='cross_positive_list')
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], permission_classes=(IsAuthenticated,))
    def user_negative_list(self, request, *args, **kwargs):
        result = self.get_result(request, action='negative_list')
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], permission_classes=(IsAuthenticated,))
    def user_cross_negative_list(self, request, *args, **kwargs):
        result = self.get_result(request, action='cross_negative_list')
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], permission_classes=(IsAuthenticated,))
    def user_neitral_list(self, request, *args, **kwargs):
        result = self.get_result(request, action='neitral_list')
        return Response(result, status=status.HTTP_200_OK)

    def get_result(self, request, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = serializer.get_result(**kwargs)
        return result

    def get_serializer(self, *args, **kwargs):
        serializer_class = kwargs.pop('serializer_class', None)
        if serializer_class is None:
            serializer_class = self.serializer_classes[self.action]
        kwargs['context'] = self.get_serializer_context()
        return serializer_class(*args, **kwargs)


class EAViewSet(viewsets.GenericViewSet):
    """
get_actual_ea_list:
## Получить актуальный список событий и активностей ##
    Эндпоинт отдает список предстоящих && активных(is_active) событий
    и список активных(is_active) активностей

## Параметры:
    slug - опциональный, определяет какие choices запрашиваются, тип string.
    Возможные значения:
    "activities" - только активности
    "events" - только ивенты
    Если slug не указан - и то и другое
Ответ при slug='user_settings' (формат json):

event_like:
## Лайк и Анлайк события ##
если событие уже было лайкнуто, и опять пришел запрос на его лайк, событие будет "разлайкнуто" ) и так далее

activity_like:
## Лайк и Анлайк активности ##
если активность уже была лайкнута, и опять пришел запрос на её лайк, активность будет "разлайкнута" ) и так далее

user_symp:
## Симпатия/Нейтралитет юзера ##
если юзер уже был с симпатией, и опять пришел запрос user_symp с его id, юзер будет "разсимпочен",
т.е. станет нейтрален ) и так далее

user_hate:
## Игнор/Нейтралитет юзера ##
если юзер уже был в игноре, и опять пришел запрос user_hate с его id , юзер будет "разигнорен",
т.е. станет нейтрален ) и так далее


"""

    serializer_classes = {
        'event_like': EventLikeSerializer,
        'activity_like': ActivityLikeSerializer,
        'user_symp': UserSympSerializer,
        'user_hate': UserHateSerializer,
        'get_actual_ea_list': EASerializer,
    }

    @action(detail=False, methods=['post'], permission_classes=(IsAuthenticated,))
    def event_like(self, request, *args, **kwargs):
        result = self.get_result(request)
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['post'], permission_classes=(IsAuthenticated,))
    def activity_like(self, request, *args, **kwargs):
        result = self.get_result(request)
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['post'], permission_classes=(IsAuthenticated,))
    def user_symp(self, request, *args, **kwargs):
        result = self.get_result(request)
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['post'], permission_classes=(IsAuthenticated,))
    def user_hate(self, request, *args, **kwargs):
        result = self.get_result(request)
        return Response(result, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], permission_classes=(IsAuthenticated,))
    def get_actual_ea_list(self, request, *args, **kwargs):
        result = self.get_result(request)
        return Response(result, status=status.HTTP_200_OK)

    def get_result(self, request, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = serializer.get_result()
        return result

    def get_serializer(self, *args, **kwargs):
        serializer_class = kwargs.pop('serializer_class', None)
        if serializer_class is None:
            serializer_class = self.serializer_classes[self.action]
        kwargs['context'] = self.get_serializer_context()
        return serializer_class(*args, **kwargs)


class MeetUserProfile(generics.RetrieveUpdateAPIView):
    """
## получение и установка данных профиля пользователя ##
Используются след. поля профиля: 'username', 'first_name', 'last_name', 'avatar', 'email',
    """

    queryset = MeetUser.objects.all()
    serializer_class = MeetUserSerializer
    permission_classes = (IsAuthenticated,)
    http_method_names = ['get', 'patch']

    def get_object(self):
        queryset = self.get_queryset()
        obj = get_object_or_404(queryset, id=self.request.user.id)
        return obj


class ChangePasswordView(UpdateAPIView):
    """
## эндпоинт для смены пароля авторизованного пользователя ##
    """
    serializer_class = ChangePasswordSerializer
    model = MeetUser
    permission_classes = (IsAuthenticated,)
    http_method_names = ['put']

    def get_object(self, queryset=None):
        obj = self.request.user
        return obj

    def update(self, request, *args, **kwargs):
        self.object = self.get_object()
        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid():
            # Check old password
            # if not self.object.check_password(serializer.data.get("old_password")):
            #     return Response({"old_password": ["Wrong password."]}, status=status.HTTP_400_BAD_REQUEST)
            # set_password also hashes the password that the user will get
            self.object.set_password(serializer.data.get('new_password'))
            self.object.save()
            return Response('Success', status=status.HTTP_200_OK)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CustomAuthToken(ObtainAuthToken):
    """
## аутентификация по: логин/пароль (получение токена авторизации) ##
    """

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'id': user.pk,
            'token': token.key,
            'name': user.username,
            'avatar': user.avatar.url
        })


app_name = 'core'

router = DefaultRouter()
router.register(r'', EAViewSet, base_name='event_and_activity')
router.register(r'', UserRelationViewSet, base_name='user_rel')

urlpatterns = [
    path('', include(router.urls)),
    path('api-token-auth/', CustomAuthToken.as_view()),
    path('user-profile/', MeetUserProfile.as_view()),
    path('change-password/', ChangePasswordView.as_view()),
]
