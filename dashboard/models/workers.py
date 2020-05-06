# -*- coding: utf-8 -*-
from django.db import models

from dashboard.constantes import *

class Revision(models.Model):    
    envio_revision = models.ForeignKey('dashboard.Envio', null=True, on_delete=models.SET_NULL)
    fecha_inicio_rev = models.DateTimeField(auto_now_add=True)
    fecha_fin_rev = models.DateTimeField(null = True)
    estado_revision = models.IntegerField(default=0)
    worker = models.ForeignKey('dashboard.Worker', null=True, on_delete=models.SET_NULL)

class Worker(models.Model):    
    nombre = models.CharField(max_length=30, default="worker")
    fecha_registro = models.DateTimeField(auto_now_add=True)
    ip = models.CharField(max_length=30, default="worker")
