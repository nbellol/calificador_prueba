# -*- coding: utf-8 -*-
from django.shortcuts import get_object_or_404
from django.core.paginator import Paginator

import unicodedata

import dashboard.utils as utils
from dashboard.decorators import acceso_restringido, acceso_autenticado
from dashboard.constantes import PROFESOR, ESTUDIANTE, ADMINISTRADOR

from dashboard.models.problemas import Problema, Tag, Prueba, PruebaIO
from dashboard.models.envios import Envio, ResultadoEstudiante
from dashboard.models.envios import revisar_sintaxis_codigo

from dashboard.models.comentarios import ComentarioPregunta, Pregunta

from dashboard.forms import PreguntaForm, ComentarioForm, BusquedaSimpleForm, BusquedaAvanzadaForm, RetoForm, SolucionReferenciaForm


# @acceso_restringido(tipo_usuario=PROFESOR)


@acceso_autenticado()
def problemas(request):
    lista_problemas = Problema.objects.all()
    return mostrar_problemas(request, lista_problemas, BusquedaSimpleForm(), BusquedaAvanzadaForm())



@acceso_autenticado()
def buscar_problemas(request):
    if request.method == 'GET' and 'terminos_busqueda' in request.session:
        if 'page' in request.GET:
            page = request.GET["page"]
        else:
            page = 1
            
        request.POST = request.session['terminos_busqueda']
        request.POST["page"] = page
        request.method = 'POST'

    forma_simple = BusquedaSimpleForm(request.POST or None)
    if forma_simple.is_valid():
        request.session["terminos_busqueda"] = request.POST
        terminos_busqueda = forma_simple.cleaned_data.get('terminos')
        lista_problemas = Problema.buscar_problemas(terminos_busqueda)
    else:
        lista_problemas = []
        forma_simple = BusquedaSimpleForm()

    return mostrar_problemas(request, lista_problemas, forma_simple, BusquedaAvanzadaForm(), 'simple')


@acceso_autenticado()
def buscar_problemas_avanzada(request):
    if request.method == 'GET' and 'terminos_busqueda_avanzada' in request.session:
        if 'page' in request.GET:
            page = request.GET["page"]
        else:
            page = 1
            
        request.POST = request.session['terminos_busqueda_avanzada']
        request.POST["page"] = page
        request.method = 'POST'
    
    forma_simple = BusquedaSimpleForm()
    forma_avanzada = BusquedaAvanzadaForm(request.POST or None)

    if forma_avanzada.is_valid():
        request.session["terminos_busqueda_avanzada"] = request.POST
        terminos_busqueda = forma_avanzada.cleaned_data.get('terminos')
        if len(terminos_busqueda) > 0:
            lista_completa = Problema.buscar_problemas(terminos_busqueda)
        else:
            lista_completa = Problema.objects.all()

        tags = forma_avanzada.cleaned_data.get('tags').split(',')
        nivel_forma = forma_avanzada.cleaned_data.get('nivel')
        nivel = None if nivel_forma == '0' else int(nivel_forma)
        rango = int(forma_avanzada.cleaned_data.get('rango_dificultad'))
        if rango < 50:
            dif_inferior = rango
            dif_superior = dif_inferior + 10
        else:
            dif_inferior = 0
            dif_superior = 50

        lista_problemas = Problema.filtrar_resultados(lista_completa, tags, nivel, dif_inferior, dif_superior)
    else:
        lista_problemas = []
        forma_avanzada = BusquedaAvanzadaForm()

    return mostrar_problemas(request, lista_problemas, forma_simple, forma_avanzada, 'avanzada')


@acceso_autenticado()
def buscar_por_tag(request, tag_id):
    tag = get_object_or_404(Tag, id=tag_id)
    tags = [tag.texto]
    lista_completa = Problema.objects.all()
    lista_problemas = Problema.filtrar_resultados(lista_completa, tags, None, 0, 50)

    return mostrar_problemas(request, lista_problemas, BusquedaSimpleForm(), BusquedaAvanzadaForm(), 'simple')


@acceso_autenticado()
def mostrar_problemas(request, lista_problemas, forma_simple, forma_avanzada, busqueda=None):
    usuario = utils.reconstruir_usuario(request)

    if usuario.tipo == ESTUDIANTE:
        lista_problemas = list(filter(lambda prob: prob.publico, lista_problemas))

    lista_parejas = []
    for pr in lista_problemas:
        resultado = pr.buscar_resultado_problema_estudiante(usuario.id)
        lista_parejas.append((pr, resultado))

    tags = Tag.objects.all().order_by('texto')

    paginator = Paginator(lista_parejas, 10)
    if request.method == 'POST':
        page = request.POST.get('page')
    else:
        page = request.GET.get('page')
        
    lista_parejas = paginator.get_page(page)

    template_name = "dashboard/problemas_estudiante.html"
    context = {"lista_problemas": lista_parejas,
               "form" : forma_simple,
               "forma_avanzada" : forma_avanzada,
               "tags": tags,
               "tipo_busqueda": busqueda,
               "es_admin": usuario.tipo == ADMINISTRADOR,
               "es_profesor": usuario.tipo == PROFESOR}

    return utils.render_page(request, template_name, context)





@acceso_autenticado()
def problemas_autor(request, id_autor):
    lista_parejas = []
    lista_problemas = Problema.objects.filter(autor_id=id_autor)

    for pr in lista_problemas:
        lista_parejas.append((pr, None))

    template_name = "dashboard/problemas_estudiante.html"
    context = {"lista_problemas": lista_parejas}
    return utils.render_page(request, template_name, context)


@acceso_autenticado()
def problema(request, slug):
    problema = get_object_or_404(Problema, slug=slug)
    usuario = utils.reconstruir_usuario(request)

    tipo_formulario = str(request.POST.get("tipo_formulario", None))
    if tipo_formulario == "pregunta":
        form = PreguntaForm(request.POST or None, request.FILES or None)
        mensaje = agregar_pregunta_problema(form, usuario, problema)
    elif tipo_formulario == "respuesta":
        form = ComentarioForm(request.POST or None, request.FILES or None)
        mensaje = agregar_respuesta_problema(form, usuario)
    else:
        mensaje = None

    resultado_problema = None
    envios = None
    permiso_envio = True

    if usuario.tipo == ESTUDIANTE:
        resultado_problema = problema.buscar_resultado_problema_estudiante(usuario.id)
        envios = problema.buscar_envios_problema(usuario.id)
    else:
        permiso_envio = False

    template_name = "dashboard/problema_es.html"
    context = {"problema": problema,
               "form_pregunta": PreguntaForm(),
               "form_respuesta": ComentarioForm(),
               "resultado_problema": resultado_problema,
               "permiso_envio": permiso_envio,
               "mensaje": mensaje,
               "envios": envios}
    return utils.render_page(request, template_name, context)


def agregar_pregunta_problema(form, usuario, problema):
    if form.is_valid():
        nueva = Pregunta()
        cd = form.cleaned_data
        titulo = unicodedata.normalize("NFC", cd.get("titulo"))
        contenido = unicodedata.normalize("NFC", cd.get("contenido"))
        nueva.titulo = titulo.capitalize()
        nueva.contenido = contenido
        nueva.tipo = cd.get("tipo")
        nueva.autor = usuario
        nueva.problema = problema
        nueva.save()
        return "Nueva pregunta agregada"
    else:
        return "Hay un error en el formulario"


def agregar_respuesta_problema(form, usuario):
    if form.is_valid():
        nuevo = ComentarioPregunta()
        cd = form.cleaned_data
        titulo = unicodedata.normalize("NFC", cd.get("titulo"))
        contenido = unicodedata.normalize("NFC", cd.get("contenido"))
        nuevo.titulo = titulo.capitalize()
        nuevo.contenido = contenido
        nuevo.pregunta = Pregunta.objects.get(pk=cd.get("id_pregunta"))
        nuevo.autor = usuario
        nuevo.save()
        return "Nueva respuesta agregada"
    else:
        return "Hay un error en el formulario"


@acceso_restringido(tipo_usuario=PROFESOR)
def problema_nuevo(request):
    template_name = "dashboard/problemas/problema_new.html"
    context = {}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ADMINISTRADOR)
def solucion_referencia(request, slug):
    problema = get_object_or_404(Problema, slug=slug)
    usuario = utils.reconstruir_usuario(request)
    tipo_forma = str(request.POST.get("tipo_forma", None))
    
    if request.POST.get("guardar", None) is not None:
        return guardar_solucion_referencia(request, problema)
    
    elif request.POST.get("correr", None) is not None:
        return correr_solucion_referencia(request, problema)
        
    else:
        return mostrar_solucion_referencia(request, problema)


def correr_solucion_referencia(request, problema):
    forma = SolucionReferenciaForm()
    forma = SolucionReferenciaForm(initial={'codigo_solucion': problema.codigo_solucion_referencia,
                           'slug_problema': problema.slug,
                           'tipo_forma': 'guardar'})
        
    context = {"id_problema": problema.id,
               "problema": problema,
               "forma": forma,
               "codigo_limpio": problema.solucion_referencia,
               "evaluacion": None,
               "mensaje": ""}
    
    resultados = problema.correr_solucion_referencia()
    context["resultados"] = resultados
    
    template_name = "dashboard/problemas/problema_ad.html"            
    return utils.render_page(request, template_name, context)


def mostrar_solucion_referencia(request, problema):
    forma = SolucionReferenciaForm()
    forma = SolucionReferenciaForm(initial={'codigo_solucion': problema.codigo_solucion_referencia,
                           'slug_problema': problema.slug,
                           'tipo_forma': 'guardar'})        
    
    context = {"problema": problema,
               "mensaje": "",
               "forma": forma,
               "evaluacion": None}
    template_name = "dashboard/problemas/problema_ad.html"
    return utils.render_page(request, template_name, context)    


def guardar_solucion_referencia(request, problema):
    forma = SolucionReferenciaForm(request.POST or None, request.FILES or None)

    context = {"id_problema": problema.id,
               "problema": problema,
               "forma": forma,
               "codigo_limpio": "",
               "evaluacion": None,
               "mensaje": ""}
    
    if forma.is_valid():
        cd = forma.cleaned_data
        codigo = cd.get('codigo_solucion')
        resultado = revisar_sintaxis_codigo(codigo)
        if resultado[0] == 0:
            evaluacion = None
            problema.solucion_referencia = codigo
            problema.save()
        else:
            evaluacion = list()
            if len(resultado[1]) > 0:
                evaluacion.extend(resultado[1].strip().split("\n"))
            if len(resultado[2]) > 0:
                evaluacion.extend(resultado[2].strip().split("\n"))    

        context["evaluacion"] = evaluacion
    else:
        mensaje = "Hubo un problema validando el formulario"        
        context["mensaje"] = mensaje
        
    template_name = "dashboard/problemas/problema_ad.html"
    return utils.render_page(request, template_name, context)    
