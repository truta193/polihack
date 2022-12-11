from rest_framework.generics import RetrieveUpdateDestroyAPIView, ListCreateAPIView
from rest_framework.permissions import IsAuthenticated
from django_filters import rest_framework as filters
from .models import Person, Document, Request
from .serializers import PersonSerializer, DocumentSerializer, RequestSerializer
from .pagination import CustomPagination
from .filters import PersonFilter

# For pacient

class ListCreatePersonAPIView(ListCreateAPIView):
    serializer_class = PersonSerializer
    queryset = Person.objects.all()
    pagination_class = CustomPagination
    filter_backends = (filters.DjangoFilterBackend,)
    filterset_class = PersonFilter


class RetrieveUpdateDestroyPersonAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = PersonSerializer
    queryset = Person.objects.all()


# For request

class ListCreateRequestAPIView(ListCreateAPIView):
    serializer_class = RequestSerializer
    queryset = Request.objects.all()
    pagination_class = CustomPagination


class RetrieveUpdateDestroyRequestAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = RequestSerializer
    queryset = Request.objects.all()

# For document

class ListCreateDocumentAPIView(ListCreateAPIView):
    serializer_class = DocumentSerializer
    queryset = Document.objects.all()
    pagination_class = CustomPagination


class RetrieveUpdateDestroyDocumentAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = DocumentSerializer
    queryset = Document.objects.all()


