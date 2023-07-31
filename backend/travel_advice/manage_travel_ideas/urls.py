from django.urls import path
from . import views
 
urlpatterns = [
     path('', views.IdeaApiOverview, name='api_list'),
     path('create/', views.created_ideas, name='create_ideas'),
     path('all/', views.view_ideas, name='view_ideas'),
     path('update/<int:pk>/', views.update_ideas, name='update_ideas'),
     path('<int:pk>/', views.delete_ideas, name='delete_ideas'),
     path('<int:pk>/delete/', views.delete_ideas, name='delete_ideas'),
]