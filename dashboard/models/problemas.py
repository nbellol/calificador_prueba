# -*- coding: utf-8 -*-

import importlib
import uuid
import textwrap
from django.db import models

from dashboard.models.envios import Envio, ResultadoEstudiante
from dashboard.constantes import NUEVO, NIVEL_RETO, NINGUNO
from dashboard.constantes import TIPO_PRUEBA, ENTRADA_SALIDA


class Tag(models.Model):
    texto = models.CharField(max_length=100, default="TAG")
    descripcion = models.CharField(max_length=300, default="TAG")

    def __str__(self):
        return str(self.texto)

    def buscar_tags_intentados(id_estudiante):
        tags = Tag.objects.filter(problema__envio__estudiante_id=id_estudiante).distinct().order_by('texto')
        return tags

    def buscar_tags_intentados_seccion(id_seccion):
        tags = Tag.objects.filter(problema__envio__estudiante__seccion_id=id_seccion).distinct().order_by('texto')
        return tags

    def buscar_envios_tag_estudiante(texto_tag, id_estudiante):
        envios = Envio.objects.filter(problema__tags__texto=texto_tag).filter(estudiante_id=id_estudiante)
        return envios

    def buscar_envios_tag_seccion(texto_tag, id_seccion):
        envios = Envio.objects.filter(problema__tags__texto=texto_tag).filter(estudiante__seccion_id=id_seccion)
        return envios


    def calcular_estadisticas_tag(texto_tag, id_estudiante):
        total_puntos = 0
        correctos = 0
        envios = Envio.objects.filter(estudiante_id=id_estudiante).filter(problema__tags__texto=texto_tag)
        for envio in envios:
            if envio.avance == 100:
                correctos += 1
                total_puntos += envio.resultado_estudiante.puntos

        total = len(envios)
        porcentaje = round(correctos/total * 100, 0)
        return (porcentaje,total_puntos)


    def calcular_estadisticas_tag_seccion(texto_tag, id_seccion):
        correctos = 0

        envios = Envio.objects.filter(estudiante__seccion_id=id_seccion).filter(problema__tags__texto=texto_tag)
        for envio in envios:
            if envio.avance == 100:
                correctos += 1

        num_problemas = Problema.objects.filter(envio__estudiante__seccion_id=id_seccion).filter(tags__texto=texto_tag).distinct().count()
        total = len(envios)
        porcentaje = round(correctos/total * 100, 0)

        return (porcentaje, num_problemas, correctos, total)


class Problema(models.Model):
    slug = models.SlugField(max_length=50, null=False, unique=True)
    titulo = models.CharField(max_length=120)
    descripcion = models.TextField(null=True, blank=True)
    autor = models.ForeignKey('dashboard.Usuario', null=True, on_delete=models.SET_NULL)
    curso = models.ForeignKey('dashboard.Curso', null=True, on_delete=models.SET_NULL)
    estado = models.CharField(max_length=50)
    dificultad = models.IntegerField(default=50)
    funcion = models.CharField(max_length=120)
    retorno_tipo = models.CharField(max_length=120)
    retorno_descripcion = models.TextField(null=True, blank=True)
    tags = models.ManyToManyField('dashboard.Tag')
    publico = models.BooleanField(default=True)
    nivel = models.IntegerField(default=1, unique=False, null=False)
    ultima_modificacion = models.DateTimeField(auto_now_add=True)
    es_reto = models.BooleanField(default=False)
    nivel_reto = models.CharField(max_length=1, choices=NIVEL_RETO, default=NINGUNO)
    solucion_referencia = models.TextField(null=False, blank=True)


    def inicializar(self, titulo):
        self.titulo = titulo
        self.slug = uuid.uuid4().hex[:16]
        self.descripcion = titulo
        self.estado = NUEVO
        self.dificultad = 0
        self.funcion = 'funcion'
        self.retorno_tipo = 'None'
        self.retorno_descripcion = 'Resultado de la función'


    def __str__(self):
        return self.titulo + " (" + str(self.id) + ")"

    @property
    def nombre_nivel_reto(self):
        nivel = self.nivel_reto
        for n in NIVEL_RETO:
            if n[0] == nivel:
                return n[1]
        return "?"

    @property
    def consultar_argumentos(self):
        return self.argumento_set.all().order_by('posicion')

    @property
    def consultar_preguntas(self):
        preguntas = self.pregunta_set.all().order_by('-timestamp')
        return preguntas

    @property
    def consultar_pruebas(self):
        return self.prueba_set.all()


    def hace_parte_tarea_vencida(self, id_seccion):
        tareas = self.tarea_set.filter(seccion=id_seccion)
        if len(tareas) == 0:
            return False
        else:
            tarea = tareas.first()
            return tarea.vencida

    def consultar_resultados_estudiantes(self, login_estudiante):
        return None

    def buscar_envios_problema(self, id_estudiante):
        envios = Envio.objects.filter(problema_id=self.id, estudiante_id=id_estudiante ).order_by("-numero")
        return envios

    def buscar_resultado_problema_estudiante(self, id_estudiante):
        resultado = ResultadoEstudiante.objects.filter(problema_id=self.id, estudiante_id=id_estudiante).first()
        return resultado

    def buscar_problemas_intentados_seccion(id_seccion):
        probs = Problema.objects.filter(envio__estudiante__seccion_id=id_seccion).distinct().order_by('nivel', 'dificultad', 'titulo')
        return probs

    def calcular_estadisticas_problema_seccion(id_problema, id_seccion):
        exitosos = 0
        envios = Envio.objects.filter(estudiante__seccion_id=id_seccion).filter(problema__id=id_problema)
        ids_estudiantes = set()
        ids_estudiantes_exitosos = set()

        for envio in envios:
            ids_estudiantes.add(envio.estudiante.id)
            if envio.avance == 100:
                exitosos += 1
                ids_estudiantes_exitosos.add(envio.estudiante.id)

        num_estudiantes = len(ids_estudiantes)
        num_estudiantes_exitosos = len(ids_estudiantes_exitosos)
        totales = len(envios)
        if totales > 0:
            porcentaje = round(exitosos/totales * 100, 0)
        else:
            porcentaje = 0

        return (porcentaje, totales, exitosos, num_estudiantes, num_estudiantes_exitosos)

    @property
    def plantilla_funcion(self):
        argumentos = self.consultar_argumentos
        args = self.construir_argumentos(argumentos)
        docs = self.construir_documentacion(argumentos)
        plantilla = "def {0}({1})->{2}:\n{3}\n    pass".format(self.funcion, args, self.retorno_tipo, docs)
        return plantilla

    def construir_argumentos(self, argumentos):
        args = ""
        for i, arg in enumerate(argumentos):
            if i > 0:
                args += ", "
            args += '{}: {}'.format(arg.nombre, arg.tipo)

        return args

    def construir_documentacion(self, argumentos):
        docs = '    """ {}'.format(self.titulo)
        docs += '\n    Parámetros:'
        for arg in argumentos:
            inicio = arg.nombre + "(" + arg.tipo + "):"
            argudesc = textwrap.fill(arg.descripcion, width=(100-len(inicio)))
            arguindent = textwrap.indent(argudesc, " " * (8+len(inicio))).strip()
            docs += '\n      {} ({}): {}'.format(arg.nombre, arg.tipo, arguindent)
        docs += '\n    Retorno:'

        descripcion  = textwrap.fill(self.retorno_descripcion, width=100)
        indentado = textwrap.indent(descripcion, " " * (8+len(self.retorno_tipo))).strip()
        docs += '\n      {}: {}'.format(self.retorno_tipo, indentado)
        docs += '\n    """'
        return docs

    @property
    def signatura(self):
        argumentos = self.consultar_argumentos
        args = self.construir_argumentos(argumentos)
        signatura = "def {0}({1})->{2}:".format(self.funcion, args, self.retorno_tipo)
        return signatura

    @property
    def signatura_html(self):
        import dashboard.utils as utils
        return utils.pygmentify(self.signatura, False)

    @property
    def codigo_solucion_referencia(self):
        codigo = self.solucion_referencia

        if codigo == "":
            return self.plantilla_funcion
        else:
            return codigo


    def buscar_retos_nivel(nivel):
        retos = Problema.objects.filter(es_reto=True).filter(nivel=nivel)
        return retos


    def buscar_problemas_con_termino_titulo(termino):
        problemas = Problema.objects.filter(titulo__icontains=termino)
        return problemas

    def buscar_problemas_con_termino_descripcion(termino):
        problemas = Problema.objects.filter(descripcion__icontains=termino)
        return problemas

    def buscar_problemas_con_termino_tag(termino):
        tags = Tag.objects.filter(texto__icontains=termino)
        problemas = []
        for tag in tags:
            problemas.extend(tag.problema_set.all())

        return problemas

    def refinar_terminos(terminos_busqueda):
        import re

        terminos = []

        sin_espacios = " ".join(terminos_busqueda.split())
        partes = re.findall(r'"(.*?)"|(\w+)', sin_espacios)

        for parte in partes:
            if parte[0] == '':
                terminos.append(parte[1].strip())
            else:
                terminos.append(parte[0].strip())

        return terminos

    def buscar_problemas(terminos_busqueda):
        PUNTOS_TITULO = 10
        PUNTOS_DESCRIPCION = 5
        PUNTOS_TAG = 15

        terminos = Problema.refinar_terminos(terminos_busqueda)

        problemas = dict() #  Las llaves son los ids, los valores son una tupla (Problema, puntos)

        for termino in terminos:
            pr_titulo = Problema.buscar_problemas_con_termino_titulo(termino)
            pr_desc = Problema.buscar_problemas_con_termino_descripcion(termino)
            pr_tags = Problema.buscar_problemas_con_termino_tag(termino)
            Problema.puntuar_problemas(problemas, pr_titulo, PUNTOS_TITULO)
            Problema.puntuar_problemas(problemas, pr_desc, PUNTOS_DESCRIPCION)
            Problema.puntuar_problemas(problemas, pr_tags, PUNTOS_TAG)

        ordenados = sorted(problemas.values(), key=lambda kv: kv[1], reverse=True)

        lista_problemas = []
        for problema, puntos in ordenados:
            lista_problemas.append(problema)

        return lista_problemas

    def puntuar_problemas(puntos_problemas, lista_problemas, puntos_criterio):
        for pr in lista_problemas:
            problema = puntos_problemas.get(pr.id, None)
            if problema is None:
                puntos_problemas[pr.id] = (pr, puntos_criterio)
            else:
                puntos = puntos_problemas[pr.id][1] + puntos_criterio
                puntos_problemas[pr.id] = (pr, puntos)

    def filtrar_resultados(lista_problemas, tags: list, nivel: int, minimo: int, maximo: int):
        filtrados = set()

        # Filtrar por nivel: sólo los que sean del nivel
        for pr in lista_problemas:
            if nivel is None or pr.nivel == nivel:
                filtrados.add(pr)

        # Filtrar por dificultad: : sólo los que estén en el rango
        filtrados2 = filtrados
        filtrados = set()
        for pr in filtrados2:
            dif = pr.dificultad
            if dif >= minimo and dif <= maximo:
                filtrados.add(pr)

        # Filtrar por tag: sólo los que tengan ALGUNO de los tags
        for nombre_tag in tags:
            if nombre_tag != '':
                con_tag = Problema.filtrar_por_tag(filtrados, nombre_tag)
                filtrados = filtrados.intersection(con_tag)

        return filtrados

    def filtrar_por_tag(lista_problemas, nombre_tag):
        filtrados = set()
        tag = Tag.objects.get(texto=nombre_tag)

        for pr in lista_problemas:
            if tag in pr.tags.all():
                filtrados.add(pr)

        return filtrados

    def correr_solucion_referencia(self):
        # Eliminar la solución de referencia anterior
        try:
            del solucion_ref
        except UnboundLocalError as inst:
            print("No había una solución de referencia cargada", type(inst), inst.args)

        # Crear el archivo con la solución de referencia que se va a probar
        noise = uuid.uuid4().hex[:8]
        modulo_solucion = "solucion_referencia_" + noise
        archivo = open("soluciones/" + modulo_solucion + ".py", "w")
        archivo.write(self.solucion_referencia)
        archivo.close()

        solucion_ref = importlib.import_module("soluciones." + modulo_solucion)
        llamado = "solucion_ref.{}({})"

        resultados = []

        pruebas = self.prueba_set.all()

        for prueba in pruebas:
            if prueba.tipo == "IO":
                pruebaIO = PruebaIO.objects.get(id=prueba.id)
                prueba_numero = pruebaIO.numero
                prueba_desc = pruebaIO.descripcion
                prueba_res = True
                resultado_prueba = {"prueba_num": prueba_numero,
                                    "prueba_desc": prueba_desc,
                                    "prueba_res" : prueba_res,
                                    "prueba_mensaje": "Todos los casos de prueba fueron exitosos",
                                    "casos": []}
                resultados.append(resultado_prueba)

                entradas = pruebaIO.entrada.split('\n')
                salidas = pruebaIO.salida.split('\n')
                if len(entradas) != len(salidas):
                    resultado_prueba["prueba_res"] = False
                    resultado_prueba["prueba_mensaje"] = "La cantidad de casos de entrada es diferente a la cantidad de casos de salida"
                else:
                    for i in range(len(entradas)):
                        print(llamado.format(self.funcion, entradas[i]))
                        try:
                            resultado = eval(llamado.format(self.funcion, entradas[i]), {"solucion_ref": solucion_ref}, {})
                        except Exception as inst:
                            resultado = str(type(inst)) + " -- " + str(inst.args)

                        caso_res = (resultado == eval(salidas[i]))
                        resultado_caso = {"caso_num": i + 1,
                                          "caso_entrada": entradas[i],
                                          "caso_salida": repr(resultado) + " [" + type(resultado).__name__ + "]",
                                          "caso_esperado": salidas[i],
                                          "caso_res": caso_res
                                         }
                        resultado_prueba["casos"].append(resultado_caso)
                        if not caso_res:
                            resultado_prueba["prueba_res"] = False

        return resultados



class Argumento(models.Model):
    posicion = models.IntegerField(default=1)
    nombre = models.CharField(max_length=50, default="input")
    tipo = models.CharField(max_length=30, default="str")
    descripcion = models.CharField(max_length=300, default="descripcion")
    problema = models.ForeignKey("dashboard.Problema", null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return str(self.nombre + ": " + self.tipo)


class Recurso(models.Model):
    descripcion = models.CharField(max_length=300, default="descripcion")
    url = models.URLField(max_length=2000)
    problema = models.ForeignKey(Problema, null=True, on_delete=models.SET_NULL)


class ConsultaRecurso(models.Model):
    problema = models.ForeignKey('dashboard.Recurso', null=True, on_delete=models.SET_NULL)
    usuario = models.ForeignKey('dashboard.Usuario', null=True, on_delete=models.SET_NULL)
    timestamp = models.DateTimeField(auto_now_add=True)


class Prueba(models.Model):
    numero = models.IntegerField(default=1)
    descripcion = models.CharField(max_length=120, default="Prueba")
    comentario_ok = models.CharField(max_length=120)
    comentario_error = models.CharField(max_length=120)
    problema = models.ForeignKey(Problema, null=True, on_delete=models.SET_NULL)
    tiempo = models.IntegerField(default=5)
    tipo = models.CharField(max_length=2, choices=TIPO_PRUEBA, default=ENTRADA_SALIDA)
    peso = models.FloatField(default=1, blank=False)

    def __str__(self):
        if self.problema is not None:
            return str(self.problema.titulo) + " - " + str(self.numero) + ": " + self.descripcion
        else:
            return self.numero



class PruebaScript(Prueba):
    script = models.TextField(null=False, default="")


class PruebaIO(Prueba):
    entrada = models.TextField(null=False, default="")
    salida = models.TextField(null=False, default="")
