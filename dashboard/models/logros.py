# -*- coding: utf-8 -*-

from django.db import models

from dashboard.constantes import *


class Medalla(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=300, default="TAG")
    nivel = models.IntegerField(default=1)
    cantidad = models.IntegerField()

    def __str__(self):
        return "Medalla: " + str(self.nombre) + " - " + self.nombre_tipo()

    def nombre_tipo(self):
        tipo = ""
        if self.nivel == 1:
            tipo = "Bronce"
        elif self.nivel == 2:
            tipo = "Plata"
        else:
            tipo = "Oro"
        return tipo


class Logro(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    usuario = models.ForeignKey('dashboard.Usuario', null=True, on_delete=models.SET_NULL)
    medalla = models.ForeignKey('dashboard.Medalla', null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return str(self.usuario.nombre) + " --> " + str(self.medalla)

    def buscar_medallas_usuario(id_usuario):
        medallas = list()
        logros = Logro.objects.filter(usuario_id=id_usuario).order_by("-timestamp")
        for logro in logros:
            medallas.append(logro.medalla)
        return medallas
