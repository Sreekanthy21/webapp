"""
Created on Sep 10, 2014

@author sreekanthy21@gmail.com

Sreekanth Yekabathula

URL'S code for Online Store.
"""


# Django imports
from django.conf.urls.defaults import patterns
from django.views.generic.simple import redirect_to

# local imports
import views


urlpatterns = patterns('',
    (r'^$', views.home),
    (r'^allcustomers/$', views.allcustomers),
    (r'^allproducts/$', views.allproducts),
    (r'^allorders/$', views.allorders),
)
