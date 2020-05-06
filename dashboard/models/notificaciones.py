# -*- coding: utf-8 -*-
from django.db import models
from django.shortcuts import reverse

from dashboard.constantes import TIPO_NOTIFICACION, MENSAJE, ENVIO_RECIBIDO, ENVIO_REVISADO, RESPUESTA
from dashboard.constantes import PREGUNTA_PROBLEMA, PREGUNTA_ESTUDIANTE, ESTUDIANTE, TAREA_DISPONIBLE


# Los siguientes imports tienen que ver con el módulo de Signals
from django.db.models.signals import post_save
from django.dispatch import receiver
from dashboard.models.comentarios import Pregunta, ComentarioPregunta
from dashboard.models.usuarios import Estudiante
from dashboard.models.envios import Envio


class Notificacion(models.Model):
    usuario = models.ForeignKey('dashboard.Usuario', null=True, on_delete=models.SET_NULL)
    tipo = models.CharField(max_length=2, choices=TIPO_NOTIFICACION, default=MENSAJE)
    contenido = models.TextField(null=True, blank=True)
    leida = models.BooleanField(default=False)
    timestamp = models.DateTimeField(auto_now_add=True)
    link = models.CharField(max_length=300, null=True)

    @property
    def resumen(self):
        return self.contenido
        """
        for nombre, descripcion in TIPO_NOTIFICACION:
            if nombre == self.tipo:
                return descripcion
        return TIPO_NOTIFICACION
        """

    def buscar_notificaciones_pendientes_usuario(id_usuario):
        notificaciones = Notificacion.objects.filter(usuario_id=id_usuario, leida=False).order_by("-timestamp")
        return notificaciones

    def buscar_notificaciones_usuario(id_usuario):
        notificaciones = Notificacion.objects.filter(usuario_id=id_usuario).order_by("-timestamp")
        return notificaciones

    def contar_notificaciones_pendientes(id_usuario):
        notificaciones = Notificacion.objects.all()
        return len(notificaciones)

    def marcar_todas_leidas(id_usuario):
        notificaciones = Notificacion.objects.filter(usuario_id=id_usuario, leida=False)
        for notif in notificaciones:
            notif.leida = True
            notif.save()


@receiver(post_save, sender=ComentarioPregunta, dispatch_uid="respuesta_pregunta")
def registrar_respuesta_pregunta(sender, instance=None, created=True, **kwargs):
    """
    Notificar que le respondieron una pregunta
    """
    base = "Se recibió una respuesta para la pregunta '{}'"
    respuesta = instance
    notificacion = Notificacion()
    notificacion.usuario = respuesta.pregunta.autor
    notificacion.tipo = RESPUESTA
    notificacion.contenido = base.format(respuesta.pregunta.titulo)

    slug = respuesta.pregunta.problema.slug
    url = reverse('problema', args=(slug,))
    link = url + "#pregunta" + str(respuesta.pregunta.id)
    notificacion.link = link

    notificacion.save()

    # print("NOT: Respuesta registrada: ", sender, instance, created)


@receiver(post_save, sender=Pregunta, dispatch_uid="pregunta_problema")
def registrar_pregunta_problema(sender, instance=None, created=True, **kwargs):
    """
    Se creó una nueva pregunta en un problema en el que es autor
    """
    base = "Se recibió una pregunta para el problema '{}'"
    pregunta = instance
    notificacion = Notificacion()
    notificacion.usuario = pregunta.problema.autor
    notificacion.tipo = PREGUNTA_PROBLEMA
    notificacion.contenido = base.format(pregunta.problema.titulo)

    slug = pregunta.problema.slug
    url = reverse('problema', args=(slug,))
    link = url + "#pregunta" + str(pregunta.id)
    notificacion.link = link

    notificacion.save()

    # print("NOT: Pregunta registrada: ", sender, instance, created)


@receiver(post_save, sender=Pregunta, dispatch_uid="pregunta_seccion")
def registrar_pregunta_seccion(sender, instance=None, created=True, **kwargs):
    """
    Notificar que un estudiante de su sección dejó una pregunta
    """
    base = "El estudiante {} (sección {}) dejó una pregunta para el problema '{}'"
    pregunta = instance

    autor = pregunta.autor

    # La notificación sólo se genera cuando la pregunta la puso un estudiante
    if autor.tipo == ESTUDIANTE:
        estudiante = Estudiante.objects.get(pk=autor.id)
        nombre = estudiante.nombre
        seccion = estudiante.seccion.numero
        problema = pregunta.problema.titulo
        profesores = estudiante.seccion.profesor_set.all()

        for prof in profesores:
            notificacion = Notificacion()
            notificacion.usuario = prof
            notificacion.tipo = PREGUNTA_ESTUDIANTE
            notificacion.contenido = base.format(nombre, seccion, problema)

            slug = pregunta.problema.slug
            url = reverse('problema', args=(slug,))
            link = url + "#pregunta" + str(pregunta.id)
            notificacion.link = link

            notificacion.save()

        # print("NOT: Pregunta en sección: ", sender, instance, created)


@receiver(post_save, sender=Envio, dispatch_uid="envio_recibido")
def registrar_envio_recibido(sender, instance=None, created=True, **kwargs):
    """
    Notificar que un envío fue recibido
    """
    if created:
        base = 'Envío #{} recibido para el problema "{}"'
        notificacion = Notificacion()
        notificacion.usuario = instance.estudiante
        notificacion.tipo = ENVIO_RECIBIDO
        notificacion.contenido = base.format(str(instance.numero), instance.problema.titulo)
    
        slug = instance.slug
        url = reverse('envio', args=(slug,))
        notificacion.link = url
    
        notificacion.save()

    # print("NOT: Envio recibido", sender, instance, created)


@receiver(post_save, sender="dashboard.Tarea", dispatch_uid="tarea_seccion")
def registrar_tarea_seccion(sender, instance=None, created=True, **kwargs):
    """
    Tarea disponible
    """
    base = "La tarea {} ya está disponible."
    tarea = instance
    num_tarea = tarea.numero
    seccion = tarea.seccion

    estudiantes = seccion.estudiante_set.all()

    for est in estudiantes:
        notificacion = Notificacion()
        notificacion.usuario = est
        notificacion.tipo = TAREA_DISPONIBLE
        notificacion.contenido = base.format(num_tarea)

        url = reverse('tarea', args=(tarea.id,))
        notificacion.link = url

        notificacion.save()

    # print("NOT: Nueva tarea: ", sender, instance, created)

# Notificar nueva tarea disponible para mi sección

# Notificar nueva medalla

# Notificar que un envio fue calificado
@receiver(post_save, sender="dashboard.Envio", dispatch_uid="envio_revisado")
def registrar_envio_revisado(sender, instance=None, created=True, **kwargs):
    """
    Un envio fue calificado
    """

    if not created:
        envio = instance
        base = 'Envio #{} del problema "{}" revisado'
        num_envio = envio.numero
        problema = envio.problema.titulo
        estudiante = envio.estudiante
    
        notificacion = Notificacion()
        notificacion.usuario = estudiante
        notificacion.tipo = ENVIO_REVISADO
        notificacion.contenido = base.format(num_envio, problema)
    
        slug = envio.slug
        url = reverse('envio', args=(slug,))
        notificacion.link = url
    
        notificacion.save()
    
        # print("NOT: Envio revisado: ", sender, instance, created)
    else:
        # print("NOT: El envio es nuevo!: ", sender, instance, created)
        pass
    
    
# Notificar que Una tarea está calificada

    
# Notificar que una tarea se completó
