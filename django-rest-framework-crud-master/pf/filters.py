from django_filters import rest_framework as filters
from .models import Person

class PersonFilter(filters.FilterSet):
    gender = filters.CharFilter(lookup_expr='icontains')
    age = filters.NumberFilter()

    class Meta:
        model = Person
        fields = ['gender', 'age']

