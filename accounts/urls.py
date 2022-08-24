from django.urls import path
from .import views
#from django.contrib.auth import views as auth_views
from django.urls import path

# importing views from views..py


	



urlpatterns = [
    path('', views.home,name='home'),
     path('signup/', views.signup, name="signup"),
      path('signin/', views.signin, name="signin"),
      path('logout/', views.logout, name="logout"),
     path('upload/', views.upload, name="upload"),
     path('dashboard/',views.dashboard, name="dashboard"),
     path('dash/',views.dash, name="dash"),
     
     path('activate/<uidb64>/<token>',
    
        views.activate, name='activate'),
  

    
]