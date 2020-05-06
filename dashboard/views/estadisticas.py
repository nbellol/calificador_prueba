# -*- coding: utf-8 -*-

from django.shortcuts import get_object_or_404, redirect, HttpResponse
from dashboard.decorators import acceso_restringido

import dashboard.utils as utils

from dashboard.constantes import PROFESOR, ESTUDIANTE, ADMINISTRADOR
from dashboard.models.usuarios import Estudiante
from dashboard.models.problemas import Tag
from dashboard.models.comentarios import Pregunta, ComentarioPregunta
from dashboard.models.envios import ResultadoEstudiante
from dashboard.models.logros import Logro, Medalla


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def logros(request):
    usuario = utils.reconstruir_usuario(request)
    medallas = Logro.buscar_medallas_usuario(usuario.id)
    template_name = "dashboard/medallas.html"
    context = {"medallas": medallas}
    return utils.render_page(request, template_name, context)


def estadisticas(request):
    template_name = "dashboard/estadisticas_generales.html"
    context = {}
    return utils.render_page(request, template_name, context)


def estadisticas_estudiante(request, id_estudiante):
    template_name = "dashboard/estadisticas_estudiante.html"
    context = {}
    return utils.render_page(request, template_name, context)


def estadisticas_propias(request):
    template_name = "dashboard/estadisticas_estudiante.html"
    context = {}
    return utils.render_page(request, template_name, context)


def estadisticas_problema(request, slug_problema):
    template_name = "dashboard/estadisticas_problema.html"
    context = {}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR ])
def analisis_estudiante(request, id_estudiante):
    estudiante = get_object_or_404(Estudiante, pk=id_estudiante)
    medallas = Logro.buscar_medallas_usuario(estudiante.id)

    resultados = ResultadoEstudiante.buscar_resultados_estudiante(estudiante.id)
    preguntas = Pregunta.buscar_preguntas_estudiante(estudiante.id)
    respuestas = ComentarioPregunta.buscar_respuestas_estudiante(estudiante.id)

    tags = Tag.buscar_tags_intentados(id_estudiante)

    parejas_tags = []
    for tag in tags:
        porcentaje, puntos = Tag.calcular_estadisticas_tag(tag.texto, estudiante.id)
        parejas_tags.append((tag, porcentaje, puntos))


    template_name = "dashboard/perfil/analisis_estudiante.html"
    context = {"estudiante": estudiante,
               "medallas": medallas,
               "lista_problemas": resultados,
               "preguntas_estudiante": preguntas,
               "respuestas_estudiante": respuestas,
               "tags": parejas_tags}
    
    return utils.render_page(request, template_name, context)

