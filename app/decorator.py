"""
Created on Sep 10, 2014

@author sreekanthy21@gmail.com

Sreekanth Yekabathula

Logging decorators for Online Store.
"""


# system imports
from functools import wraps
import types
import logging
import json

# Django imports
from django.http import HttpResponse


def view_wrapper(logger_name):
    def wrapped_f(f):
        def wrapper(request, *args, **kwargs):
            logger = logging.getLogger(logger_name)
            logger.info("%s: %s %s request" % (f.__name__, request.method,
                                               request.path))
            try:
                response = f(request, *args, **kwargs)
                logger.info("%s: %s %s response %d"
                            % (f.__name__, request.method, request.path,
                               response.status_code))
                return response
            except Exception, e:
                logger.exception(str(e))
                raise e
        return wraps(f)(wrapper)
    return wrapped_f
