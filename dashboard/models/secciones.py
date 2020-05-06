# -*- coding: utf-8 -*-
"""
En este módulo se definen clases que son administradas por django:
    Curso
    CursoSemestre
    Seccion
"""

from django.db import models


class Curso(models.Model):
    """
    Esta clase sirve para representar un curso que ese Senecode.
    Un curso agrupa secciones en diferentes semestres.
    """
    nombre_curso = models.CharField(max_length=120, unique=True)
    codigo_curso = models.CharField(max_length=20, unique=True, default="DEPT-1234")

    def __str__(self):
        return self.nombre_curso


class CursoSemestre(models.Model):
    """
    Esta clase sirve para representar semestres en los que haya secciones.
    Un CursoSemestre únicamente tiene un nombre, el cual no tiene ningún formato definido.
    """

    nombre_semestre = models.CharField(max_length=120, unique=True)

    def __str__(self):
        return self.nombre_semestre

    def semestres():
        """
        Retorna todos los semestres del sistema
        """
        return CursoSemestre.objects.all()


class Seccion(models.Model):
    """
    Esta clase sirve para representar secciones de un curso en un semestre particular.
    Una sección tiene profesores y estudiantes.
    """

    numero = models.IntegerField(default=1)
    nombre_semestre = models.CharField(max_length=16)
    curso_seccion = models.ForeignKey("dashboard.Curso", null=True, on_delete=models.SET_NULL)

    def crear_seccion(numero_seccion: int, nombre_semestre: str, curso: Curso):
        """
        Crea una nueva sección con los parámetros dados
        Parámetros:
            numero_seccion: el número de la nueva sección
            nombre_semestre: el nombre del semestre en el que se va a crear la sección
            curso: el curso al que va a pertenecer la sección
        Return:
            (Seccion) : La nueva sección que fue creada
        """
        nueva_seccion = Seccion()
        nueva_seccion.numero = numero_seccion
        nueva_seccion.nombre_semestre = nombre_semestre
        nueva_seccion.curso_seccion = curso
        nueva_seccion.save()
        return nueva_seccion

    def buscar_seccion(curso: Curso, semestre: str, num_seccion: str):
        """ Busca una sección dado el curso, semestre y número de la sección
        Parámetros:
            curso (Curso): El curso del que debe hacer parte la sección
            semestre (str): El nombre del semestre en que se busca la sección
            num_seccion (id): El número de la sección (no el identificador)
        Retorno:
            (Seccion): La sección que cumple con los criterios o None
        """
        secciones = Seccion.objects.filter(curso_seccion=curso).filter(nombre_semestre=semestre).filter(numero=num_seccion)
        if len(secciones) > 0:
            return secciones[0]
        return None

    def __str__(self):
        if self.curso_seccion is None:
            cod = "***"
        else:
            cod = self.curso_seccion.codigo_curso
        return cod + " - " + self.nombre_semestre + ": " +  str(self.numero)

    @property
    def cantidad_estudiantes(self) -> int:
        """
        Esta propiedad calcula la cantidad de estudiantes en la sección
        Retorno:
            (int): Cantidad de estudiantes
        """
        numero = self.estudiante_set.count()
        return numero

    def secciones():
        """
        Retorna todas las secciones del sistema
        """
        return Seccion.objects.all()

    def secciones_semestre(semestre: str):
        """ Busca todas las secciones de un semestre particular
        Parámetros:
            semestre (str): El nombre del semestre para el que se van a buscar las secciones
        """
        return Seccion.objects.filter(nombre_semestre=semestre)

    @property
    def profesores(self):
        """
        Esta propiedad calcula el conjunto de los profesores de la sección
        """
        return self.profesor_set.all()
