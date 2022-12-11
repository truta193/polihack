from rest_framework import serializers
from .models import Person, Request, Document


class PersonSerializer(serializers.ModelSerializer):  
    class Meta:
        model = Person
        fields = ('CNP', 'name', 'age', 'created_at', 'contact', 'gender','tag')


class RequestSerializer(serializers.ModelSerializer):  
    class Meta:
        model = Request
        fields = ('id', 'type', 'details', 'person')

class DocumentSerializer(serializers.ModelSerializer):  
    class Meta:
        model = Document
        fields = ('id', 'request', 'details')
