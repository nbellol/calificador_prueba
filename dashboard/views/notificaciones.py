# -*- coding: utf-8 -*-

from django.shortcuts import redirect, reverse

import dashboard.utils as utils
from dashboard.decorators import acceso_autenticado
from dashboard.models.notificaciones import Notificacion


@acceso_autenticado()
def notificaciones(request):
    usuario = utils.reconstruir_usuario(request)
    template_name = "dashboard/notificaciones.html"
    context = {"notificaciones_completas" : Notificacion.buscar_notificaciones_usuario(usuario) }
    return utils.render_page(request, template_name, context)


@acceso_autenticado()
def marcar_leidas(request):
    usuario = utils.reconstruir_usuario(request)
    Notificacion.marcar_todas_leidas(usuario.id)
    return redirect(reverse('notificaciones'))
