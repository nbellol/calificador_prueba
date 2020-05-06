# -*- coding: utf-8 -*-

from django.shortcuts import get_object_or_404
from django.http import Http404, HttpResponse

import json
import dashboard.utils as utils
from dashboard.decorators import acceso_restringido, acceso_autenticado
from dashboard.models.usuarios import Usuario
from dashboard.models.secciones import Seccion
from dashboard.models.envios import Envio, ResultadoEstudiante
from dashboard.models.notificaciones import Notificacion
from dashboard.models.comentarios import Pregunta
from dashboard.models.tareas import ResultadoTarea
from dashboard.models.comentarios import ComentarioPregunta

from dashboard.constantes import PROFESOR, ESTUDIANTE, ADMINISTRADOR, MONITOR


@acceso_autenticado()
def home(request):
    usuario = get_object_or_404(Usuario, pk=request.session['id_usuario'])
    tipo = usuario.tipo
    if tipo == ESTUDIANTE:
        return home_estudiante(request)
    elif tipo == PROFESOR:
        return home_profesor(request)
    elif tipo == ADMINISTRADOR:
        return home_admin(request)
    elif tipo == MONITOR:
        return home_monitor(request)


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def home_estudiante(request):
    estudiante = utils.reconstruir_estudiante(request)
    envios = Envio.buscar_envios_estudiante(estudiante.id)[0:3]
    notificaciones = Notificacion.buscar_notificaciones_pendientes_usuario(estudiante.id)[0:3]
    lista_parejas = ResultadoTarea.parejas_tarea_resultado(estudiante, True)[0:3]

    estadisticas = dict()
    estadisticas["respuestas"] = ComentarioPregunta.objects.filter(autor_id=estudiante.id).count()
    estadisticas["intentos"] = Envio.objects.filter(estudiante_id=estudiante.id).count()
    estadisticas["resueltos"] = ResultadoEstudiante.objects.filter(estudiante_id=estudiante.id).filter(resuelto=True).count()
    if estadisticas["intentos"] > 0:
        estadisticas["tasa"] = str(int((estadisticas["resueltos"] / estadisticas["intentos"])*100)) + "%"
    else:
        estadisticas["tasa"] = "0%"

    template_name = "dashboard/homes/home_estudiante.html"
    context = {"envios_cortados": envios,
               "notificaciones_cortadas": notificaciones,
               "lista_tareas": lista_parejas,
               "estudiante": estudiante,
               "estadisticas": estadisticas}

    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=PROFESOR)
def home_profesor(request):
    profesor = utils.reconstruir_profesor(request)
    notificaciones = Notificacion.buscar_notificaciones_pendientes_usuario(profesor.id)[0:3]
    lista_parejas = profesor.buscar_tareas_profesor()[0:3]
    estudiantes = profesor.buscar_estudiantes_profesor("202010")
    preguntas = Pregunta.buscar_preguntas_problemas_autor(profesor.id)[0:3]

    template_name = "dashboard/homes/home_profesor.html"
    context = {"notificaciones_cortadas": notificaciones,
               "lista_tareas": lista_parejas,
               "secciones": profesor.buscar_secciones_profesor("202010"),
               "estudiantes": estudiantes,
               "profesor": profesor,
               "preguntas": preguntas}

    return utils.render_page(request, template_name, context)

def tutorial(request):
    template_name = "dashboard/tutorial.html"
    context = {}
    return utils.render_page(request, template_name, context)

def faq(request):
    template_name = "dashboard/faq.html"
    context = {}
    return utils.render_page(request, template_name, context)



def ajax_estudiantes_seccion(request, id_seccion):
    if True: # request.is_ajax():
        seccion = get_object_or_404(Seccion, pk=id_seccion)
        estudiantes = seccion.estudiante_set.all().order_by("solo_apellido", "solo_nombre")        
        template_name = "dashboard/bloques/estudiantes_seccion.html"
        context = {"estudiantes": estudiantes, "seccion": seccion}
        return utils.render_page(request, template_name, context)

        """
        todo_items = ['task 1', 'task 2']
        data = json.dumps(todo_items)
        return HttpResponse(data, content_type='application/json')
        """
        
    else:
        raise Http404





def home_monitor(request):
    template_name = "dashboard/homes/home_monitor.html"
    context = {}
    return utils.render_page(request, template_name, context)


def home_admin(request):
    template_name = "dashboard/homes/home_admin.html"
    context = {}
    return utils.render_page(request, template_name, context)


def contactenos(request):
    template_name = "dashboard/contactenos.html"
    context = {}

    return utils.render_page(request, template_name, context)
