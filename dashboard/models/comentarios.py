# -*- coding: utf-8 -*-
from django.db import models

from dashboard.constantes import *

from dashboard.forms import ComentarioForm


class Pregunta(models.Model):
    titulo = models.CharField(max_length=100, default="Resumen pregunta")
    contenido = models.TextField(null=True, blank=True)
    problema = models.ForeignKey('dashboard.Problema', null=True, on_delete=models.SET_NULL)
    resuelta = models.BooleanField(default=False)
    autor = models.ForeignKey('dashboard.Usuario', null=True, on_delete=models.SET_NULL)
    tipo = models.CharField(max_length=40, default="Aclaracion")
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.titulo) + " - " + str(self.id)

    @property
    def tipo_pregunta(self):
        for tipo, nombre in TIPOS_PREGUNTAS:
            if tipo == self.tipo:
                return nombre
        return "Tipo pregunta"
    
    @property
    def consultar_comentarios(self):
        return self.comentariopregunta_set.all()

    @property
    def get_respuesta_form(self):
        form_respuesta = ComentarioForm({'titulo': 'Respuesta a pregunta', "id_pregunta": self.id})
        return form_respuesta

    def buscar_preguntas_estudiante(id_estudiante):
        preguntas = Pregunta.objects.filter(autor_id=id_estudiante)
        return preguntas

    @property
    def sin_respuesta(self):
        if len(self.comentariopregunta_set.all()) == 0:
            return True
        return False

    def buscar_preguntas_problemas_autor(id_autor):        
        preguntas = Pregunta.objects.filter(problema__autor_id=id_autor).order_by("-timestamp")
        return preguntas


class ComentarioProblema(models.Model):
    titulo = models.CharField(max_length=100, default="Resumen pregunta")
    contenido = models.TextField(null=True, blank=True)
    problema = models.ForeignKey('dashboard.Problema', null=True, on_delete=models.SET_NULL)
    autor = models.ForeignKey('dashboard.Usuario', null=True, on_delete=models.SET_NULL)
    timestamp = models.DateTimeField(auto_now_add=True)


class ComentarioPregunta(models.Model):
    titulo = models.CharField(max_length=100, default="Resumen pregunta")
    contenido = models.TextField(null=True, blank=True)
    pregunta = models.ForeignKey('dashboard.Pregunta', null=True, on_delete=models.SET_NULL)
    autor = models.ForeignKey('dashboard.Usuario', null=True, on_delete=models.SET_NULL)
    timestamp = models.DateTimeField(auto_now_add=True)

    def buscar_respuestas_estudiante(id_estudiante):
        preguntas = ComentarioPregunta.objects.filter(autor_id=id_estudiante)
        return preguntas
