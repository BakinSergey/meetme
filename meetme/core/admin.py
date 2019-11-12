from django.contrib import admin
from django.utils.html import format_html

from .models import *


# Register your models here.


class MeetUserAdmin(admin.ModelAdmin):
    list_display = ('sex', 'username', 'last_name', 'first_name', 'email', 'is_superuser',
                    'symp_with', 'unsymp_with',
                    'liked_activities', 'liked_actual_events',
                    )


class ActivityAdmin(admin.ModelAdmin):

    def image_tag(self, obj):
        return format_html('<img src="{}" width="120" height="120" />'.format(obj.image.url))

    image_tag.short_description = 'Activity Image'

    list_display = ('name', 'category', 'image_tag', 'is_active',)
    readonly_fields = ('image_tag',)


class EventAdmin(admin.ModelAdmin):

    def image_tag(self, obj):
        return format_html('<img src="{}" width="120" height="120" />'.format(obj.image.url))

    image_tag.short_description = 'Event Image'

    list_display = ('name', 'dt', 'category', 'image_tag', 'is_active',)
    readonly_fields = ('image_tag',)





class EventCategoryAdmin(admin.ModelAdmin):
    list_display = ('name',)


admin.site.register(MeetUser, MeetUserAdmin)

admin.site.register(Activity, ActivityAdmin)

admin.site.register(Event, EventAdmin)

admin.site.register(EventCategory, EventCategoryAdmin)
