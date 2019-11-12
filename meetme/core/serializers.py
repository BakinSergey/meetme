import random
import os
import json

from rest_framework import serializers, status
from rest_framework.exceptions import ValidationError
from rest_framework.response import Response

from django.conf import settings
from django.core.cache import cache
from django.core.cache.backends.base import DEFAULT_TIMEOUT

import core.utils as utils
from core.models import MeetUser, Event, Activity
import core.utils


class MeetUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = MeetUser
        fields = ('id', 'username', 'first_name', 'last_name', 'avatar', 'email',)


class ChangePasswordSerializer(serializers.Serializer):

    # old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)


class UserRelationSerializer(serializers.Serializer):

    @staticmethod
    def do_user_resp(users):
        resp = []
        for u in users:
            item = {
                'id': u.pk,
                'name': u.username,
                'avatar': u.avatar.url
            }
            resp.append(item)
        return resp

    def get_result(self, **kwargs):
        user = self.context['request'].user
        action = kwargs['action']
        result = {}

        if action == 'likeme_list':
            result = self.do_user_resp(user.likeme_list.all())
        if action == 'positive_list':
            result = self.do_user_resp(user.positive_list.all())
        if action == 'cross_positive_list':
            result = self.do_user_resp(user.cross_positive_list.all())
        if action == 'negative_list':
            result = self.do_user_resp(user.negative_list.all())
        if action == 'cross_negative_list':
            result = self.do_user_resp(user.cross_negative_list.all())
        if action == 'neitral_list':
            result = self.do_user_resp(user.neitral_list.all())

        return result


class EventLikeSerializer(serializers.Serializer):

    event_id = serializers.IntegerField(required=True)

    def get_result(self):
        eid = self.validated_data['event_id']
        user = self.context['request'].user
        if eid in user.liked_actual_events:
            user.unlike_event(e_id=eid)
        else:
            user.like_event(e_id=eid)
        return 'ok'


class ActivityLikeSerializer(serializers.Serializer):

    activity_id = serializers.IntegerField(required=True)

    def get_result(self):
        aid = self.validated_data['activity_id']
        user = self.context['request'].user
        if aid in user.liked_activities:
            user.unlike_activity(act_id=aid)
        else:
            user.like_activity(act_id=aid)
        return 'ok'


class UserSympSerializer(serializers.Serializer):

    user_id = serializers.IntegerField(required=True)

    def get_result(self):
        uid = self.validated_data['user_id']
        user = self.context['request'].user
        if uid in user.symp_with:
            user.unsymp_user(user_id=uid)
        else:
            user.symp_user(user_id=uid)
        return 'ok'


class UserHateSerializer(serializers.Serializer):

    user_id = serializers.IntegerField(required=True)

    def get_result(self):
        uid = self.validated_data['user_id']
        user = self.context['request'].user
        if uid in user.unsymp_with:
            user.restore_user(user_id=uid)
        else:
            user.ignore_user(user_id=uid)
        return 'ok'


class EASerializer(serializers.Serializer):

    PREDEFINED = ['events', 'activities', ]
    slug = serializers.ChoiceField(required=False, choices=PREDEFINED)

    def create(self, validated_data):
        pass

    def update(self, instance, validated_data):
        pass

    @staticmethod
    def do_activity_resp(activities):
        resp = []
        for a in activities:
            item = {
                'id': a.pk,
                'name': a.name,
                'cat': a.category.name,
                'image': a.image.url
            }
            resp.append(item)
        return resp

    @staticmethod
    def do_event_resp(events):
        resp = []
        for e in events:
            item = {
                'id': e.pk,
                'name': e.name,
                'cat': e.category.name,
                'dt': e.dt,
                'image': e.image.url
            }
            resp.append(item)
        return resp

    def get_result(self):
        slug = self.validated_data.get('slug', '')
        result = {}

        if slug == self.PREDEFINED[0] or not slug:
            result['events'] = self.do_event_resp(Event.current_events.all())

        if slug == self.PREDEFINED[1] or not slug:
            result['activities'] = self.do_activity_resp(Activity.current_activities.all())

        return result
