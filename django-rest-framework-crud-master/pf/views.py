from rest_framework.generics import RetrieveUpdateDestroyAPIView, ListCreateAPIView
from rest_framework.permissions import IsAuthenticated
from django_filters import rest_framework as filters
from .models import Person
from .serializers import PersonSerializer
from .pagination import CustomPagination
from .filters import PersonFilter


class ListCreatePersonAPIView(ListCreateAPIView):
    serializer_class = PersonSerializer
    queryset = Person.objects.all()
    pagination_class = CustomPagination
    filter_backends = (filters.DjangoFilterBackend,)
    filterset_class = PersonFilter


class RetrieveUpdateDestroyPersonAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = PersonSerializer
    queryset = Person.objects.all()



