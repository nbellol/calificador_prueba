# -*- coding: utf-8 -*-
import os
import random
import sys
from django.conf import settings
from django.db import models
from django.contrib.auth.hashers import PBKDF2PasswordHasher

from dashboard.models.envios import Envio

from dashboard.constantes import TIPO_USUARIO, ESTUDIANTE, PROFESOR


class Usuario(models.Model):
    login = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=200)
    nombre = models.CharField(max_length=120)
    alias = models.CharField(max_length=120, blank=True)
    avatar = models.ImageField(upload_to='image/', blank=True, null=True)
    tipo = models.CharField(max_length=2, choices=TIPO_USUARIO, default=ESTUDIANTE)
    ultimo_acceso = models.DateTimeField(auto_now_add=True)
    puntos = models.IntegerField(default=0)
    medallas = models.IntegerField(default=0)
    usuario_local = models.BooleanField(default=False)

    def __str__(self):
        return self.login + " (" + self.tipo + ")"

    @property
    def descripcion_tipo_usuario(self):
        descripcion = "Tipo inesperado ... "
        for abr, desc in TIPO_USUARIO:
            if abr == self.tipo:
                descripcion = desc
        return descripcion

    def cambiar_password(self, nuevo_password):
        hasher = PBKDF2PasswordHasher()
        self.password = hasher.encode(nuevo_password, self.nombre)
        self.save()

    def verificar_password(self, password_forma):
        if self.usuario_local:
            return self.verificar_password_local(password_forma)
        else:
            return self.verificar_password_ldap(password_forma)

    def verificar_password_ldap(self, password):
        import ldap as auth
        login = self.login + '@uniandes.edu.co'
        resultado = False
        try:
            con = auth.initialize('ldap://adua.uniandes.edu.co:389', bytes_mode=False)
            con.simple_bind_s(login, password)
            resultado = True
        except:
            print("Error!", sys.exc_info()[0])
        return resultado

    def verificar_password_local(self, password_forma):
        verificador = PBKDF2PasswordHasher()
        resultado = verificador.verify(password_forma, self.password)
        return resultado

    def usuario_existe(login):
        existe = len(Usuario.objects.filter(login=login)) > 0
        return existe


class Estudiante(Usuario):
    seccion = models.ForeignKey('dashboard.Seccion', null=True, on_delete=models.SET_NULL)
    pulso_actividad = models.FileField(upload_to='pulso/', blank=True, null=True)
    pulso_puntos = models.FileField(upload_to='pulso/', blank=True, null=True)
    preguntas_sin_respuesta = models.BooleanField(default=False)
    solo_nombre = models.CharField(max_length=120)
    solo_apellido = models.CharField(max_length=120)

    def __str__(self):
        return self.login + " -- " + str(self.seccion)

    @property
    def num_problemas_resueltos(self):
        resueltos = Envio.objects.filter(estudiante_id=self.id).filter(avance=100)
        return len(resueltos)

    @property
    def num_intentos(self):
        intentos = Envio.objects.filter(estudiante_id=self.id)
        return len(intentos)

    @property
    def eficiencia(self):
        intentos = self.num_intentos
        resueltos = self.num_problemas_resueltos
        if intentos == 0:
            return 0

        eficiencia = resueltos/intentos * 100
        return round(eficiencia, 0)

    @property
    def preguntas_sin_respuesta(self):
        from dashboard.models.comentarios import Pregunta
        preguntas = Pregunta.objects.filter(autor_id=self.id)
        sin_respuesta = False
        for pr in preguntas:
            if pr.sin_respuesta:
                sin_respuesta = True
        return sin_respuesta

    def crear_estudiante(login, nombre, apellido, seccion):
        nuevo_estudiante = Estudiante()
        nuevo_estudiante.login = login
        nuevo_estudiante.nombre = (nombre + " " + apellido).title()
        nuevo_estudiante.alias = nuevo_estudiante.nombre
        nuevo_estudiante.solo_nombre = nombre.title()
        nuevo_estudiante.solo_apellido = apellido.title()
        nuevo_estudiante.tipo = ESTUDIANTE
        nuevo_estudiante.seccion = seccion
        nuevo_estudiante.avatar = "avatars/" + find_random_avatar()
        nuevo_estudiante.save()
        nuevo_estudiante.cambiar_password(login)
        return nuevo_estudiante


class Profesor(Usuario):
    secciones = models.ManyToManyField('dashboard.Seccion', blank=True)
    # debería tener multiples secciones

    def buscar_secciones_profesor(self, nombre_semestre = None):
        if nombre_semestre is None:
            secciones = self.secciones.all().order_by('-nombre_semestre','numero')
        else:
            secciones = self.secciones.filter(nombre_semestre = nombre_semestre).order_by('-nombre_semestre','numero')

        return secciones

    def buscar_secciones_antiguas(self, nombre_semestre=None):
        if nombre_semestre is None:
            secciones = self.secciones.all().order_by('-nombre_semestre', 'numero')
        else:
            secciones = self.secciones.exclude(nombre_semestre=nombre_semestre).order_by('-nombre_semestre', 'numero')

        return secciones

    def buscar_tareas_profesor(self):
        from dashboard.models.tareas import Tarea, ResultadoTarea

        lista_parejas = []
        secciones = self.secciones.all().order_by('-nombre_semestre','numero')
        for seccion in secciones:
            tareas_seccion = Tarea.buscar_tareas_seccion(seccion.id).order_by("-fecha_limite")
            for tarea in tareas_seccion:
                avance = 0
                cantidad = 0
                resultados_seccion = ResultadoTarea.buscar_resultados_tarea(tarea.id)
                for resultado in resultados_seccion:
                    cantidad += 1
                    avance += resultado.avance
                if cantidad > 0:
                    avance_tarea = round(avance/cantidad, 1)
                else:
                    avance_tarea = 0
                lista_parejas.append((tarea, avance_tarea))
        lista_parejas.sort(key=lambda pareja: pareja[0].fecha_limite, reverse=True)
        return lista_parejas

    def buscar_tareas_profesor_con_estadisticas(self):
        from dashboard.models.tareas import Tarea, ResultadoTarea

        lista_parejas = []
        secciones = self.secciones.all().order_by('-nombre_semestre', 'numero')
        for seccion in secciones:

            tareas_seccion = Tarea.buscar_tareas_seccion(seccion.id).order_by("-fecha_limite")

            for tarea in tareas_seccion:
                # estadisticas_tarea = ResultadoTarea.buscar_estadisticas_tarea(tarea.id)
                estadisticas_tarea = ResultadoTarea.buscar_estadisticas_tarea_rapida(tarea)
                lista_parejas.append((tarea, estadisticas_tarea))

        lista_parejas.sort(key=lambda pareja: pareja[0].fecha_limite, reverse=True)
        return lista_parejas

    def buscar_estudiantes_profesor(self, nombre_semestre=None):
        estudiantes = []
        secciones = self.buscar_secciones_profesor(nombre_semestre)

        for seccion in secciones:
            estudiantes_seccion = seccion.estudiante_set.all().order_by("solo_apellido", "solo_nombre")
            estudiantes.extend(estudiantes_seccion)
        return estudiantes

    def crear_profesor(login, nombre, seccion):
        nuevo_prof = Profesor()
        nuevo_prof.login = login
        nuevo_prof.nombre = nombre.title()
        nuevo_prof.alias = nuevo_prof.nombre
        nuevo_prof.tipo = PROFESOR
        nuevo_prof.avatar = "avatars/" + find_random_avatar()
        nuevo_prof.save()
        nuevo_prof.secciones.add(seccion)
        nuevo_prof.save()
        nuevo_prof.cambiar_password(login)
        return nuevo_prof

    def agregar_seccion(self, seccion):
        self.secciones.add(seccion)


def find_random_avatar():
    base = settings.MEDIA_ROOT + '/avatars/avatars_basico'
    archivos = os.listdir(base)
    return 'avatars_basico/' + random.choice(archivos)


class Monitor(Usuario):
    secciones = models.ManyToManyField('dashboard.Seccion', blank=True)
    # debería tener multiples secciones


class Registro(models.Model):
    usuario = models.ForeignKey('dashboard.Usuario', null=True, on_delete=models.SET_NULL)
    ip = models.CharField(max_length=15, default="0.0.0.0", null=True)
    timestamp = models.DateTimeField(auto_now_add=True)
