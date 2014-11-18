"""
Created on Sep 10, 2014

@author sreekanthy21@gmail.com

Sreekanth Yekabathula

Top level URLConf for Online Store.
"""


# Django imports
from django.conf.urls.defaults import patterns, include, url
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.generic.simple import redirect_to

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()


urlpatterns = patterns('',
    # APP
    url(r'^app/', include('webapp.app.urls')),
)

urlpatterns += staticfiles_urlpatterns()

