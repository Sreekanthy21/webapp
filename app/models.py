"""
Created on Sep 10, 2014

@author sreekanthy21@gmail.com

Sreekanth Yekabathula

Models code for Online Store.
"""


from django.db import models
#Model Classes for Online Store


class Customers(models.Model):
    """
      Customer class for customer table.
    """
    uid = models.IntegerField()
    username = models.CharField(max_length=50)
    fullname = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    mobile = models.CharField(max_length=10)
    city = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    isactive = models.IntegerField()
    create_date = models.DateTimeField()

    def __unicode__(self):              # __unicode__ on Python 2
        return self.username

    class Meta:
        """
           Table name mapping.
        """
        db_table = "customers"


class Products(models.Model):
    """
       Products class for products table.
    """"
    pid = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    value = models.FloatField()
    instock = models.IntegerField()
    create_date = models.DateTimeField()
    last_modified = models.DateTimeField()

    def __unicode__(self):              # __unicode__ on Python 2
        return self.username

    class Meta:
        """
           Table name mapping.
        """
        db_table = "products"
