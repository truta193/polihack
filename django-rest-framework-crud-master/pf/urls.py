from django.urls import path
from . import views


urlpatterns = [
    path('', views.ListCreatePersonAPIView.as_view(), name='get_post_pepople'),
    path('documents', views.ListCreateDocumentAPIView.as_view(), name='get_post_documents'),
    path('requests', views.ListCreateRequestAPIView.as_view(), name='get_post_requests'),
    path('<int:pk>/', views.RetrieveUpdateDestroyPersonAPIView.as_view(), name='get_delete_update_pepople'),
    path('documents/<int:pk>/', views.RetrieveUpdateDestroyDocumentAPIView.as_view(), name='get_delete_update_documents'),
    path('requests/<int:pk>/', views.RetrieveUpdateDestroyRequestAPIView.as_view(), name='get_delete_update_requests'),

]