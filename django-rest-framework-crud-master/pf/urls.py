from django.urls import path
from . import views


urlpatterns = [
    path('', views.ListCreatePersonAPIView.as_view(), name='get_post_movies'),
    path('<int:pk>/', views.RetrieveUpdateDestroyPersonAPIView.as_view(), name='get_delete_update_movie'),
]