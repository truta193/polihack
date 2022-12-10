from rest_framework import serializers
from .models import Person
from django.contrib.auth.models import User


class PersonSerializer(serializers.ModelSerializer):  
    class Meta:
        model = Person
        fields = ('CNP', 'name', 'age', 'created_at', 'contact', 'tag')
