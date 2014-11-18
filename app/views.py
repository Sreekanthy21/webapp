"""
Created on Sep 10, 2014

@author sreekanthy21@gmail.com

Sreekanth Yekabathula

Views code for Online Store.
"""


# system imports
from __future__ import division
import logging
import logging.handlers

# Django imports
from django.conf import settings
from django.shortcuts import render
from django.template import RequestContext
from django.shortcuts import render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.db import connection
from django.shortcuts import render

#App specific Imports
from app.models import Customers
from app.models import Products

logger = logging.getLogger('OnlineStore')


logger.info('Home Page request has been made..')
def home(request):
    """
    Sample Online Stores Home Page.
    """

    logger.info('Displayed Welcome Message !!!')

    return render(request, 'home.html')


def allcustomers(request):
    """
    List All Active customers from database
    """

    # This data is driven by using ORM
    users = Customers.objects.filter(isactive=1).values("username", "fullname",
                                                        "email", "mobile",
                                                        "city", "country")

    return render(request, 'allcustomers.html', {"users": users})


def allproducts(request):
    """
    List All Products from inventory.
    """

    # This data is driven by ORM raw query
    allproducts = Products.objects.raw("select pid, name, value, create_date, \
                                       instock from products")
    
    return render(request, 'allproducts.html', {"products": allproducts})


def allorders(request):
    """
    View All Orders from History
    """

    # This data is driven by using cursors
    cursor = connection.cursor()
    sql = "SELECT username, orderid, name, quantity, totalvalue, ordertime \
        FROM orders od, products pr, customers cu WHERE cu.uid = od.uid \
        AND pr.pid = od.pid"

    result = cursor.execute(sql)

    data, orders = cursor.fetchall(), []

    for row in data:
        (username, orderid, name, quantity, totalvalue, ordertime,) = row
        orders.append({"username": username, "orderid": orderid, "name": name,
                       "quantity": quantity, "total": totalvalue,
                       "ordertime": ordertime})

    return render(request, 'allorders.html', {"orders": orders})
