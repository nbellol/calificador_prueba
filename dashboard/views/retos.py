# -*- coding: utf-8 -*-
from django.shortcuts import get_object_or_404, HttpResponse
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned

import pandas as pd
import uuid
import string

import dashboard.utils as utils
from dashboard.decorators import acceso_restringido, acceso_autenticado
from dashboard.constantes import ADMINISTRADOR, ESTUDIANTE
from dashboard.constantes import BASICO, MEDIO, AVANZADO
from dashboard.forms import RetoForm
from dashboard.models.problemas import Problema, Tag, Argumento, Prueba, PruebaIO, PruebaScript
from dashboard.constantes import SCRIPT


@acceso_autenticado()
def retos(request, nivel=1):

    lista_problemas = Problema.buscar_retos_nivel(nivel)
    usuario = utils.reconstruir_usuario(request)

    num_avance = 0
    num_total = len(lista_problemas)

    lista_parejas_b = []
    lista_parejas_m = []
    lista_parejas_a = []
    for pr in lista_problemas:
        resultado = pr.buscar_resultado_problema_estudiante(usuario.id)
        if resultado is not None and resultado.resuelto:
            num_avance += 1

        if pr.nivel_reto == BASICO:
            lista_parejas_b.append((pr, resultado))
        elif pr.nivel_reto == MEDIO:
            lista_parejas_m.append((pr, resultado))
        elif pr.nivel_reto == AVANZADO:
            lista_parejas_a.append((pr, resultado))

    if usuario.tipo != ESTUDIANTE:
        avance = None
    elif num_total > 0:
        avance = str(int(round(num_avance / num_total *  100, 0))) + "%"
    else:
        avance = "0%"

    template_name = "dashboard/retos/retos.html"
    context = {"lista_problemas_b": lista_parejas_b,
               "lista_problemas_m": lista_parejas_m,
               "lista_problemas_a": lista_parejas_a,
               "nivel": nivel,
               "tipo_busqueda": "",
               "num_avance": num_avance,
               "num_total": num_total,
               "avance": avance}

    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ADMINISTRADOR)
def nuevo_reto(request):
    forma = RetoForm(request.POST or None, request.FILES or None)
    tipo_forma = str(request.POST.get("tipo_forma", None))
    mensaje = ""

    if tipo_forma == 'None':
        template_name = "dashboard/retos/nuevo_reto.html"
        forma = RetoForm()
        context = {"forma": forma,
                   "mensaje": mensaje}
        return utils.render_page(request, template_name, context)

    elif forma.is_valid():
        cd = forma.cleaned_data

        noise = uuid.uuid4().hex[:16]
        filename = "reto_" + noise + ".csv"
        utils.handle_uploaded_csv(request.FILES['archivo_csv'], filename)

        datos = procesar_archivo_csv('image/csv/' + filename)

        nivel_reto = cd.get("nivel")
        curso = cd.get("curso")
        autor = cd.get("autor")

        num_pruebas = 33

        nuevo = Problema()
        nuevo.inicializar(datos["titulo"])
        nuevo.descripcion = datos["descripcion"]
        nuevo.dificultad = datos["dificultad"]
        nuevo.funcion = datos["funcion"]
        nuevo.retorno_tipo = datos["retorno_tipo"]
        nuevo.retorno_descripcion = datos["retorno_descripcion"]
        nuevo.nivel = datos["nivel"]
        nuevo.es_reto = True
        nuevo.nivel_reto = nivel_reto
        nuevo.curso = curso
        nuevo.autor = autor
        nuevo.save()

        for num_parametro in datos["parametros"]:
            parametro = datos["parametros"][num_parametro]
            arg = Argumento()
            arg.posicion = num_parametro
            arg.nombre = parametro["nombre"]
            arg.tipo = parametro["tipo"]
            arg.descripcion = parametro["descripcion"]
            arg.problema = nuevo
            arg.save()


        for etiqueta in datos["etiquetas"]:
            try:
                tag = Tag.objects.get(texto__iexact=etiqueta)
            except ObjectDoesNotExist:
                tag = Tag()
                tag.texto = etiqueta
                tag.descripcion = etiqueta
                tag.save()
            except MultipleObjectsReturned:
                tag = Tag.objects.filter(texto__iexact=etiqueta)[0]
            nuevo.tags.add(tag)

        nuevo.save()

        for num_prueba in datos["pruebas"]:
            prueba = datos["pruebas"][num_prueba]
            if prueba["script"]:
                pr = PruebaScript()
                pr.tipo = SCRIPT
            else:
                pr = PruebaIO()


            pr.numero = num_prueba
            pr.descripcion = prueba["nombre"]
            pr.comentario_ok = prueba["ok"]
            pr.comentario_error = prueba["error"]
            pr.tiempo = prueba["tiempo"]
            if "," in prueba["peso"]:
                prueba["peso"] = prueba["peso"].replace(",", ".")
            pr.peso = prueba["peso"]

            if prueba["script"]:
                pr.script = prueba["script"]
            else:
                pr.entrada = prueba["entrada"]
                pr.salida = prueba["salida"]
            pr.problema = nuevo
            pr.save()

        signatura = nuevo.signatura

        # tags
        # pruebas

        patron = "Reto con id {} creado: {}.\nSignatura de la función: {}.  Reto {} de nivel {} con dificultad {}."
        mensaje = patron.format(nuevo.id, nuevo.titulo, signatura, nivel_reto, nuevo.nivel, nuevo.dificultad)

        template_name = "dashboard/retos/nuevo_reto.html"

        forma = RetoForm()
        context = {"forma": forma,
                   "mensaje_ok": mensaje}

        return utils.render_page(request, template_name, context)

    else:
        mensaje = "Hubo un problema validando el formulario"
        return secciones(request)


def procesar_archivo_csv(nombre_archivo)->dict:
    data_frame = pd.read_csv(nombre_archivo)
    datos_2_columnas = data_frame.to_dict()

    parejas = zip(list(datos_2_columnas['Llave'].values()), list(datos_2_columnas['Valor'].values()))

    parametros = {}
    pruebas = {}
    datos_problema = {"parametros":parametros, "pruebas": pruebas}

    for pareja in parejas:
        if type(pareja[0]) is str:
            llave = pareja[0].lower().strip()
            valor = pareja[1].strip()

            if llave == 'titulo':
                datos_problema['titulo'] = valor
            elif llave == 'descripcion':
                datos_problema['descripcion'] = valor
            elif llave == 'etiquetas':
                if ";" in valor:
                    valor = valor.replace(";", ",")
                etiquetas = list(map(lambda x: x.strip().capitalize(), valor.split(",")))
                datos_problema['etiquetas'] = etiquetas
            elif llave == 'dificultad':
                datos_problema['dificultad'] = int(valor)
            elif llave == 'nivel':
                datos_problema['nivel'] = int(valor)
            elif llave == 'funcion':
                datos_problema['funcion'] = valor
            elif llave == 'retorno':
                datos_problema['retorno_tipo'] = valor
            elif llave == 'descripcion_retorno':
                datos_problema['retorno_descripcion'] = valor
            elif llave.startswith('parametro_'):
                num_parametro = int(llave.split("_")[1])
                tipo_valor = llave.split("_")[2]
                if num_parametro in parametros:
                    parametro = parametros[num_parametro]
                else:
                    parametro = {}
                    parametros[num_parametro] = parametro
                parametro[tipo_valor] = valor
            elif llave.startswith('prueba_'):
                num_prueba = int(llave.split("_")[1])
                tipo_valor = llave.split("_")[2]
                if num_prueba in pruebas:
                    prueba = pruebas[num_prueba]
                else:
                    prueba = {"script": False}
                    pruebas[num_prueba] = prueba
                if tipo_valor == "script":
                    prueba["script"] = True
                prueba[tipo_valor] = valor.replace('\uFEFF', '')

    return datos_problema
