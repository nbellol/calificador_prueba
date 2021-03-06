# -*- coding: utf-8 -*-
"""
En este módulo están definidas funciones que se usan de forma repetida
en toda la aplicación.
"""

from django.shortcuts import render

from dashboard.models.usuarios import Usuario, Estudiante, Profesor, Monitor
from dashboard.models.secciones import CursoSemestre
from dashboard.constantes import PROFESOR, ESTUDIANTE, MONITOR, ADMINISTRADOR
from dashboard.models.notificaciones import Notificacion


def render_page(request, template_name, context):
    usuario = reconstruir_usuario(request)
    pendientes = Notificacion.buscar_notificaciones_pendientes_usuario(usuario.id)
    context["num_medallas"] = usuario.medallas
    context["puntos"] = usuario.puntos
    context["notificaciones"] = pendientes
    context["num_notificaciones"] = len(pendientes)
    context["imagen_avatar"] = usuario.avatar
    context["menu"] = seleccionar_menu(usuario.tipo)
    if usuario.tipo == PROFESOR:
        profesor = reconstruir_profesor(request)
        context["secciones_menu_actuales"] = profesor.buscar_secciones_profesor("202010")
        context["secciones_menu_antiguas"] = profesor.buscar_secciones_antiguas("202010")
    elif usuario.tipo == ADMINISTRADOR:
        context["semestres"] = CursoSemestre.semestres()
    context["id_usuario"] = usuario.id
    #  actualizar el tiempo de la última acción del usuario ... para no dejar vencer la sesión

    return render(request, template_name, context)


def seleccionar_menu(tipo_usuario: str) -> str:
    """
    Esta función selecciona el menú que se le debe mostrar a un usuario,
    según su tipo (PROFESOR, ESTUDIANTE, MONITOR, ADMINISTRADOR)
    Parámetros:
        tipo_usuario: El tipo del usuario que requiere un menú
    Retorno:
        (str): El nombre de la plantilla con el menú para el usuario
    """
    menu = "none"
    if tipo_usuario == PROFESOR:
        menu = "navbarprof"
    elif tipo_usuario == ESTUDIANTE:
        menu = "navbarest"
    elif tipo_usuario == MONITOR:
        menu = "navbarmonitor"
    elif tipo_usuario == ADMINISTRADOR:
        menu = "navbaradmin"

    return menu + ".html"


def reconstruir_usuario(request):
    if 'usuario' not in request.session:
        return None

    login = request.session['usuario']
    result = Usuario.objects.filter(login__exact=login)
    if result:
        usuario = result.first()
        return usuario
    return None


def reconstruir_estudiante(request):
    if 'usuario' not in request.session:
        return None

    login = request.session['usuario']
    result = Estudiante.objects.filter(login__exact=login)
    if result:
        usuario = result.first()
        return usuario
    return None


def reconstruir_profesor(request):
    if 'usuario' not in request.session:
        return None

    login = request.session['usuario']
    result = Profesor.objects.filter(login__exact=login)
    if result:
        usuario = result.first()
        return usuario
    return None


def reconstruir_monitor(request):
    if 'usuario' not in request.session:
        return None

    login = request.session['usuario']
    result = Monitor.objects.filter(login__exact=login)
    if result:
        usuario = result.first()
        return usuario
    return None


def handle_uploaded_avatar(file, login, filename):
    with open('image/avatars/' + filename, 'wb+') as destination:
        for chunk in file.chunks():
            destination.write(chunk)


def handle_uploaded_file(file, login):
    with open('image/' + login + '.png', 'wb+') as destination:
        for chunk in file.chunks():
            destination.write(chunk)


def handle_uploaded_json(file, file_name):
    with open('image/json/' + file_name, 'wb+') as destination:
        for chunk in file.chunks():
            destination.write(chunk)


def handle_uploaded_csv(file, file_name):
    with open('image/csv/' + file_name, 'wb+') as destination:
        for chunk in file.chunks():
            destination.write(chunk)


def pygmentify(codigo, line_numbers=True):
    from pygments import highlight
    from pygments.lexers import PythonLexer
    from pygments.formatters import HtmlFormatter
    lex = PythonLexer()
    formatter = HtmlFormatter(cssclass="source",
                              linenos=line_numbers,
                              style='friendly')

    html_code = highlight(codigo, lex, formatter)
    return html_code


def buscar_ip(request):
    from ipware import get_client_ip

    client_ip, _ = get_client_ip(request)
    if client_ip is not None:
        return client_ip
    else:
        return None

def buscar_secciones(id_profesor):
    return []
