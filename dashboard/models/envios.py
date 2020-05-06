# -*- coding: utf-8 -*-
import dashboard.locale_bogota as local
import html

from django.db import models
from django.utils.crypto import get_random_string

from dashboard.constantes import *


class ResultadoEstudiante(models.Model):
    resuelto = models.BooleanField(default=False)
    problema = models.ForeignKey('dashboard.Problema', null=True, on_delete=models.SET_NULL)
    estudiante = models.ForeignKey('dashboard.Estudiante', null=True, on_delete=models.SET_NULL)
    primer_intento = models.DateTimeField(auto_now_add=True)
    ultimo_intento = models.DateTimeField(null=True)
    ultimo_envio = models.ForeignKey('dashboard.Envio', null=True, on_delete=models.SET_NULL)
    puntos = models.IntegerField(default=0)

    def __str__(self):
        if self.problema is not None and self.estudiante is not None:
            return str(self.problema.titulo) + " - " + str(self.estudiante.nombre) + " - " + str(self.ultimo_intento)
        else:
            return str(self.id)

    def cantidad_envios(self):
        return self.consultar_envios().count()

    @property
    def cantidad_envios_actual(self):
        return self.envio_set.count()

    def consultar_envios(self):
        return self.envio_set.all()

    def buscar_resultados_estudiante(id_estudiante):
        resultados = ResultadoEstudiante.objects.filter(estudiante_id=id_estudiante ).order_by("-ultimo_intento")
        return resultados

    def buscar_resultado_problema_estudiante(id_problema, id_estudiante):
        resultados = ResultadoEstudiante.objects.filter(problema_id=id_problema, estudiante_id=id_estudiante)
        if len(resultados) > 0:
            return resultados[0].ultimo_envio
        else:
            return None


def crear_resultado_estudiante(estudiante, problema):
    resultado = ResultadoEstudiante()
    resultado.problema = problema
    resultado.estudiante = estudiante
    resultado.save()
    return resultado



class Envio(models.Model):
    numero = models.IntegerField(default=1)
    contenido = models.TextField(null=False, blank=True)
    slug = models.SlugField(max_length=50, null=False, unique=False)
    timestamp = models.DateTimeField(auto_now_add=True)
    avance = models.FloatField(default=1)
    estudiante = models.ForeignKey('dashboard.Estudiante', null=True, on_delete=models.SET_NULL)
    problema = models.ForeignKey('dashboard.Problema', null=True, on_delete=models.SET_NULL)
    resultado_estudiante = models.ForeignKey('dashboard.ResultadoEstudiante', null=True, on_delete=models.SET_NULL)
    estado = models.CharField(max_length=2, choices=ESTADO_ENVIO, default=NUEVO)
    revision_worker = models.ForeignKey('dashboard.Revision', null=True, blank=True, on_delete=models.SET_NULL)

    def __str__(self):
        if self.problema is not None:
            titulo = self.problema.titulo
        else:
            titulo = "ninguno"

        if self.estudiante is not None:
            return str(self.estudiante.nombre) +  ": " + titulo + " - " + str(self.numero) + ": " + str(self.estado) + " " + str(self.avance)
        else:
            return str(self.id) + ": " + titulo

    @property
    def fecha_formateada(self):
        enviado = self.timestamp.astimezone(local.bogota)
        fecha = enviado.strftime("%A %d de %B - %H:%M")
        return fecha


    @property
    def descripcion_estado_envio(self):
        descripcion = "Estado inesperado ... "
        for abr, desc in ESTADO_ENVIO:
            if abr == self.estado:
                descripcion = desc
        return descripcion

    @property
    def resuelto(self):
        return self.avance == 100

    @property
    def es_nuevo(self):
        return self.estado == NUEVO

    @property
    def es_incorrecto(self):
        return self.estado == INCORRECTO

    @property
    def codigo_envio(self):
        from pygments.styles import get_style_by_name
        from pygments import highlight
        from pygments.lexers import PythonLexer
        from pygments.formatters import HtmlFormatter

        codigo = self.contenido
        html_code = highlight(codigo, PythonLexer(), HtmlFormatter(cssclass="source", linenos=True, style='friendly'))
        return html_code

    @property
    def revision_codigo(self):
        resultado = revisar_sintaxis_codigo(self.contenido + "\nprint(b)\nprint(a)")
        return resultado

    def buscar_envios_estudiante(id_estudiante):
        envios = Envio.objects.filter(estudiante_id=id_estudiante).order_by("-timestamp")
        return envios

    def buscar_envios_existosos_estudiante(id_estudiante):
        print("Envios exitosos ...")
        envios = Envio.objects.filter(estudiante_id=id_estudiante).filter(avance=100).order_by("-timestamp")
        return envios

    def buscar_envios_pendientes_estudiante(id_estudiante):
        envios = Envio.objects.filter(estudiante_id=id_estudiante ).filter(avance__lt=100).order_by("-timestamp")
        return envios

    def buscar_envios_problema_estudiante(id_estudiante, id_problema):
        envios = Envio.objects.filter(estudiante_id=id_estudiante).filter(problema_id=id_problema).order_by("-timestamp")
        return envios

    @property
    def consultar_resultados_pruebas(self):
        return self.resultadoprueba_set.all()


class ResultadoPrueba(models.Model):
    numero = models.IntegerField(default=1) # Si es necesario para poder ordenar sin recurrir a la prueba
    resultado_exitoso = models.BooleanField(default=False)  # cambiar nombre
    envio = models.ForeignKey('dashboard.Envio', null=True, on_delete=models.SET_NULL)
    prueba = models.ForeignKey('dashboard.Prueba', null=True, on_delete=models.SET_NULL)
    mensaje = models.TextField(null=True, blank=True)

    def __str__(self):
        if self.prueba is not None:
            return str(self.prueba.problema.titulo) + " - " + str(self.numero)
        else:
            return str(self.numero)

    def buscar_resultados_pruebas(id_envio):
        resultados = ResultadoPrueba.objects.filter(envio_id=id_envio).order_by("numero")
        return resultados

    @property
    def mensaje_seguro(self):
        print(self.mensaje)
        mensaje_seguro = html.escape(self.mensaje, quote=True)
        print(mensaje_seguro)
        partes_mensaje = mensaje_seguro.split("***")
        mensaje_completo = "<div>" + "</div><div>".join(partes_mensaje) + "</div>"
        return mensaje_completo


def revisar_sintaxis_codigo(codigo: str)->(int, str, str):
    # pip install --upgrade pyflakes
    import io
    import pyflakes.api as api
    from pyflakes import reporter as modReporter

    warning_stream = io.StringIO()
    error_stream = io.StringIO()
    reporter = modReporter.Reporter(warning_stream, error_stream)
    cantidad = api.check(codigo, 'Envio usuario, línea', reporter)
    warnings = warning_stream.getvalue()
    errores = error_stream.getvalue()

    return (cantidad, warnings, errores)
