from django.db.models import fields
from rest_framework import serializers
from .models import Idea
from taggit.serializers import (TagListSerializerField, TaggitSerializer)

class IdeaSerializer(TaggitSerializer, serializers.ModelSerializer):
    tags = TagListSerializerField()
    class Meta:
        model = Idea
        # fields = ["title", "destination", "description", "tags", "start_date", "end_date"]
        fields = '__all__'