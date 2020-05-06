# -*- coding: utf-8 -*-

from django.shortcuts import get_object_or_404, redirect, HttpResponse

import uuid
import dashboard.utils as utils
import dashboard.constantes as constantes
from dashboard.decorators import acceso_autenticado
from dashboard.views.homes import home
from dashboard.models.usuarios import Usuario

from dashboard.forms import AvatarForm, PasswordForm, AliasForm


@acceso_autenticado()
def perfil(request):
    template_name = "dashboard/perfil/perfil.html"
    usuario = utils.reconstruir_usuario(request)
    if usuario:
        mensaje_error = None
        mensaje_ok = None

        form = AvatarForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            extension = str(request.FILES['avatar']).lower()[-4:]
            size = request.FILES['avatar'].size
            print("Size:", size)
            if extension not in constantes.EXTENSIONES:
                mensaje_error = "Las imágenes de perfil sólo pueden estar en los siguientes formatos: jpg, png o gif"
            elif size > 1024*200:
                mensaje_error = "Las imágenes de perfil no pueden tener más de 200 kb."
            else:
                noise = uuid.uuid4().hex[:16]
                filename = usuario.login + noise + ".png"
                utils.handle_uploaded_avatar(request.FILES['avatar'], usuario.login, filename)
                usuario.avatar = "avatars/" + filename
                usuario.save()
                mensaje_ok = "Se cambió exitosamente la imagen de perfil"

        context = {"usuario": usuario,
                   "forma_avatar": AvatarForm(),
                   "forma_password": PasswordForm(),
                   "forma_alias": AliasForm(initial={'alias': usuario.alias}),
                   "mensaje_error": mensaje_error,
                   "mensaje_ok": mensaje_ok}

        return utils.render_page(request, template_name, context)
    else:
        return home(request)


@acceso_autenticado()
def cambiar_password(request):
    template_name = "dashboard/perfil/perfil.html"
    usuario = utils.reconstruir_usuario(request)

    if usuario:
        mensaje_error = None
        mensaje_ok = None
        form = PasswordForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            cd = form.cleaned_data
            actual = cd.get("actual")
            nuevo = cd.get("nuevo")
            confirmacion = cd.get("confirmacion")

            correcto = usuario.verificar_password(actual)
            if correcto:
                mensaje_error = validar_nuevo_password(nuevo, confirmacion)
                if mensaje_error is None:
                    usuario.cambiar_password(nuevo)
                    mensaje_ok = "El password se cambió exitosamente"
            else:
                mensaje_error = "El password actual no es correcto"

        context = {"usuario": usuario,
                   "forma_avatar": AvatarForm(),
                   "forma_password": PasswordForm(),
                   "forma_alias": AliasForm(initial={'alias': usuario.alias}),
                   "mensaje_error": mensaje_error,
                   "mensaje_ok": mensaje_ok}
        return utils.render_page(request, template_name, context)
    else:
        return home(request)


@acceso_autenticado()
def cambiar_alias(request):
    template_name = "dashboard/perfil/perfil.html"
    usuario = utils.reconstruir_usuario(request)

    if usuario:
        mensaje_error = None
        mensaje_ok = None
        form = AliasForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            cd = form.cleaned_data
            alias = cd.get("alias")
            usuario.alias = alias
            usuario.save()
            mensaje_ok = "El alias se cambió exitosamente por: " + alias
        else:
            mensaje_error = "No se pudo cambiar el alias del usuario"

        context = {"usuario": usuario,
                   "forma_avatar": AvatarForm(),
                   "forma_password": PasswordForm(),
                   "forma_alias": AliasForm(initial={'alias': usuario.alias}),
                   "mensaje_error": mensaje_error,
                   "mensaje_ok": mensaje_ok}
        return utils.render_page(request, template_name, context)
    else:
        return home(request)


def validar_nuevo_password(nuevo, confirmacion):
    if nuevo != confirmacion:
        return "El nuevo password y su confirmación no coinciden"
    if len(nuevo) < 3:
        return "El nuevo password debe tener al menos 3 caracteres"
    return None
