# -*- coding: utf-8 -*-

from django.shortcuts import get_object_or_404, redirect, HttpResponse
from django.core.paginator import Paginator

import uuid
import dashboard.utils as utils
from dashboard.decorators import acceso_restringido
from dashboard.constantes import PROFESOR, ESTUDIANTE, ADMINISTRADOR

from dashboard.models.problemas import Problema, Tag
from dashboard.models.usuarios import Estudiante
from dashboard.models.secciones import Seccion
from dashboard.models.tareas import Tarea, ResultadoTarea
from dashboard.models.envios import Envio, ResultadoEstudiante, ResultadoPrueba
from dashboard.models.envios import crear_resultado_estudiante
from dashboard.models.envios import revisar_sintaxis_codigo

from dashboard.forms import EnvioForm


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def submissions(request, context={}):
    estudiante = utils.reconstruir_estudiante(request)
    envios = Envio.buscar_envios_estudiante(estudiante.id)
    return mostrar_envios(request, envios, context, titulo="Todos mis envíos")


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def submissions_pendientes(request, context={}):
    estudiante = utils.reconstruir_estudiante(request)
    envios = Envio.buscar_envios_pendientes_estudiante(estudiante.id)
    return mostrar_envios(request, envios, context, titulo="Envíos pendientes")


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def submissions_exitosos(request, context={}):
    estudiante = utils.reconstruir_estudiante(request)
    envios = Envio.buscar_envios_existosos_estudiante(estudiante.id)
    return mostrar_envios(request, envios, context, titulo="Envíos exitosos")


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def mostrar_envios(request, envios, context={}, titulo="Lista de envíos"):
    """
       Muestra los envios de un estudiante que lleguen en el parámetro 'envios'
       La plantilla utilizada es "envios.html"
    """
    if request.method == 'GET' and 'page' in request.GET:
        page = request.GET["page"]
    else:
        page = 1

    paginator = Paginator(envios, 8)
    lista_envios = paginator.get_page(page)

    template_name = "dashboard/envios/envios.html"
    context["envios"] = lista_envios
    context["titulo"] = titulo
    return utils.render_page(request, template_name, context)



@acceso_restringido(tipo_usuario=ESTUDIANTE)
def submission(request, slug):
    envio = get_object_or_404(Envio, slug=slug)
    estudiante = utils.reconstruir_estudiante(request)
    if estudiante.id != envio.estudiante.id:
        return redirect("envios")

    resultados = ResultadoPrueba.buscar_resultados_pruebas(envio.id)

    template_name = "dashboard/envios/envio.html"
    context = {"envio": envio,
               "resultados": resultados}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR])
def submission_estudiante(request, slug):
    envio = get_object_or_404(Envio, slug=slug)

    resultados = ResultadoPrueba.buscar_resultados_pruebas(envio.id)

    template_name = "dashboard/envios/envio.html"
    context = {"envio": envio,
               "resultados": resultados,
               "es_profesor": True}

    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def new_submission(request, slug_problema):
    """
       Opciones de creación de nuevos envíos.
       El paso que se va a realizar dependerá del valor del campo 'tipo_forma'.
    """
    problema = get_object_or_404(Problema, slug=slug_problema)
    estudiante = utils.reconstruir_estudiante(request)
    tipo_forma = str(request.POST.get("tipo_forma", None))

    if request.POST.get("regresar", None) is not None:
        return new_submission_revisar(request, problema, estudiante)
    if tipo_forma == 'nuevo_envio':
        return new_submission_validar(request, problema, estudiante)
    elif tipo_forma == 'validada' and request.POST.get("upload", None) is not None:
        return new_submission_validada(request, problema, estudiante)
    else:
        return new_submission_vacia(request, problema, estudiante)


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def new_submission_validar(request, problema, estudiante):
    forma = EnvioForm(request.POST or None, request.FILES or None)
    mensaje = ""

    if forma.is_valid():
        cd = forma.cleaned_data
        numero_envio = cd.get('numero_envio')
        codigo = cd.get('codigo_envio').replace('\t', '    ')
        html = utils.pygmentify(codigo, True)
        resultado = revisar_sintaxis_codigo(codigo)
        if resultado[0] == 0:
            evaluacion = None
        else:
            evaluacion = list()
            if len(resultado[1]) > 0:
                evaluacion.extend(resultado[1].strip().split("\n"))
            if len(resultado[2]) > 0:
                evaluacion.extend(resultado[2].strip().split("\n"))

        forma = EnvioForm(initial={'codigo_envio': html,
                                   'slug_problema': problema.slug,
                                   'numero_envio': numero_envio,
                                   'tipo_forma': 'validada'})
        template_name = "dashboard/envios/envio_review.html"
        context = {"id_problema": problema.id,
                   "problema": problema,
                   "numero_envio": numero_envio,
                   "forma": forma,
                   "codigo_limpio": codigo,
                   'evaluacion': evaluacion}
        return utils.render_page(request, template_name, context)
    else:
        mensaje = "Hubo un problema validando el formulario"
        return new_submission_revisar(request, problema.id, "", mensaje)


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def new_submission_revisar(request, problema, estudiante):
    forma = EnvioForm(request.POST or None, request.FILES or None)
    mensaje = ""
    codigo_envio = ""
    numero_envio = 1

    if forma.is_valid():
        cd = forma.cleaned_data
        numero_envio = cd.get('numero_envio')
        codigo_envio = cd.get('codigo_envio')
    else:
        print(forma.errors)

    forma = EnvioForm(initial={'codigo_envio': codigo_envio,
                               'slug_problema': problema.slug,
                               'tipo_forma': 'nuevo_envio',
                               'numero_envio': numero_envio})

    template_name = "dashboard/envios/envio_new.html"
    context = {"problema": problema,
               "forma": forma,
               "numero_envio": numero_envio,
               "mensaje": mensaje}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def new_submission_vacia(request, problema, estudiante):
    """
    Muestra una crear un nuevo envio.
    Si el estudiante ya hizo un envío para ese mismo problema, el código inicial
    mostrado es el código del envío anterior.
    """
    numero_envio = contar_envios_anteriores(problema.id, estudiante.id) + 1
    codigo_envio = problema.plantilla_funcion
    if numero_envio > 1:
        ultimo = ResultadoEstudiante.buscar_resultado_problema_estudiante(problema.id, estudiante.id)
        codigo_envio = ultimo.contenido

    forma = EnvioForm(initial={'codigo_envio': codigo_envio,
                               'slug_problema': problema.slug,
                               'tipo_forma': 'nuevo_envio',
                               'numero_envio': numero_envio})

    template_name = "dashboard/envios/envio_new.html"
    context = {"problema": problema,
               "hace_parte_tarea_vencida": problema.hace_parte_tarea_vencida(estudiante.seccion.id),
               "forma": forma,
               "numero_envio": numero_envio,
               "mensaje": ""}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def new_submission_validada(request, problema, estudiante):
    print("subiendo la versión definitiva ....")
    forma = EnvioForm(request.POST or None, request.FILES or None)
    mensaje = ""

    if forma.is_valid():
        cd = forma.cleaned_data
        numero_envio = cd.get('numero_envio')
        numero_envios_anteriores = contar_envios_anteriores(problema.id, estudiante.id)

        if int(numero_envio) > numero_envios_anteriores:
            codigo = cd.get('codigo_envio')

            # Buscar o crear ResultadoEstudiante
            resultado = problema.buscar_resultado_problema_estudiante(estudiante.id)
            if resultado is None:
                resultado = crear_resultado_estudiante(estudiante, problema)

            # crear el envio
            nuevo_envio = Envio()
            nuevo_envio.numero = numero_envio
            nuevo_envio.contenido = codigo
            nuevo_envio.avance = 0
            nuevo_envio.estudiante = estudiante
            nuevo_envio.problema = problema
            nuevo_envio.slug = uuid.uuid4().hex[:16]
            nuevo_envio.resultado_estudiante = resultado
            nuevo_envio.save()

            # Actualizar el ResultadoEstudiante
            resultado.ultimo_envio = nuevo_envio
            resultado.save()

            mensaje = "Se recibió el intento #{} para el problema '{}'".format(numero_envio, problema.titulo)
            print("Creando el envio:", mensaje)

        context = {"mensaje": mensaje}
        return submissions(request, context)
    else:
        mensaje = "Hubo un problema validando el formulario"
        return new_submission_revisar(request, problema.id, "", mensaje)



def contar_envios_anteriores(id_problema, id_estudiante):
    cantidad = Envio.objects.filter(problema_id=id_problema, estudiante_id=id_estudiante).count()
    return cantidad


def submissions_pr(request):
    pagina = "<h1>submissions profesor</h1>"
    return HttpResponse(pagina)


def submission_pr(request):
    pagina = "<h1>submission profesor</h1>"
    return HttpResponse(pagina)



@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR])
def analisis_est_prob(request, id_estudiante, slug):
    estudiante = get_object_or_404(Estudiante, pk=id_estudiante)
    problema = get_object_or_404(Problema, slug=slug)
    envios = Envio.objects.filter(estudiante=estudiante).filter(problema=problema)
    titulo = "Analizando los envíos de {} para el problema '{}'"
    return analisis_envios(request, envios, titulo.format(estudiante.nombre, problema.titulo))


@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR])
def analisis_est_tag(request, id_estudiante, tag):
    estudiante = get_object_or_404(Estudiante, pk=id_estudiante)
    envios = Tag.buscar_envios_tag_estudiante(tag, estudiante.id)
    titulo = "Analizando los envíos de {} para el tag '{}'"
    return analisis_envios(request, envios, titulo.format(estudiante.nombre, tag))


@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR])
def analisis_seccion_tag(request, id_seccion, tag):
    seccion = get_object_or_404(Seccion, pk=id_seccion)
    envios = Tag.buscar_envios_tag_seccion(tag, seccion.id)
    titulo = "Analizando los envíos de la sección {} para el tag '{}'"
    return analisis_envios(request, envios, titulo.format(seccion.numero, tag))


@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR])
def analisis_seccion_prob(request, id_seccion, slug):
    seccion = get_object_or_404(Seccion, pk=id_seccion)
    problema = get_object_or_404(Problema, slug=slug)
    envios = Envio.objects.filter(estudiante__seccion=seccion.id).filter(problema_id=problema.id)
    titulo = "Analizando los envíos de la sección {} para el problema '{}'"
    return analisis_envios(request, envios, titulo.format(seccion.numero, problema.titulo))


@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR])
def analisis_prob_tarea(request, slug, id_tarea):
    tarea = get_object_or_404(Tarea, pk=id_tarea)
    problema = get_object_or_404(Problema, slug=slug)
    seccion = tarea.seccion
    envios = Envio.objects.filter(estudiante__seccion=seccion.id).filter(problema_id=problema.id)
    titulo = "Analizando los envíos del problema '{}' en la tarea {}"
    return analisis_envios(request, envios, titulo.format(problema.titulo, tarea.numero))

@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR])
def analisis_envios(request, envios, titulo="Analizando envios"):
    problemas = dict()

    for envio in envios:
        problema = problemas.get(envio.problema.id, None)
        if problema is None:
            problema = envio.problema
            problema.envios_seleccionados = list()
            problemas[problema.id] = problema
        problema.envios_seleccionados.append(envio)

    for problema in problemas.values():
        resumen_problema = []
        for envio in problema.envios_seleccionados:
            pruebas = envio.problema.consultar_pruebas
            resultados_envio = []
            for prueba in pruebas:
                resultado_prueba = ResultadoPrueba.objects.filter(envio=envio, prueba=prueba).first()
                if resultado_prueba is not None:
                    resultados_envio.append(resultado_prueba)
                else:
                    resultados_envio.append(None)
            resumen_problema.append((envio, resultados_envio))
        problema.matriz = resumen_problema

    template_name = "dashboard/envios/envios_analisis.html"
    context = {"problemas": problemas.values(),
               "titulo": titulo,
}

    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ADMINISTRADOR)
def panic(request):
    plantilla = "{}: Actualizando el resultado de {} para la tarea {}<br/>\n"
    plantilla2 = "Avance: {}  - Calificación: {}/100<br/>\n"
    msg = ""
    resultados = ResultadoTarea.objects.all()
    for res in resultados:
        msg0 = ""
        if res.estudiante == None or res.tarea == None:
            print("Weird ....", res)
        else:
            msg0 += plantilla.format(res.id, res.estudiante.nombre, res.tarea.numero)
            msg0 += "Actual --> "
            res.actualizar_avance_tarea()
            msg0 += plantilla2.format(res.avance, res.calificacion_tarea)

            msg0 += "Nueva --> "
            msg0 += plantilla2.format(res.avance, res.calificacion_tarea)
            print(msg0)
            msg += msg0

    return HttpResponse("OK: " + msg)


def panic_shell():
    plantilla = "{}: Actualizando el resultado de {} para la tarea {}<br/>\n"
    plantilla2 = "Avance: {}  - Calificación: {}/100<br/>\n"
    msg = ""
    resultados = ResultadoTarea.objects.all()
    for res in resultados:
        msg0 = ""
        if res.estudiante == None or res.tarea == None:
            print("Weird ....", res)
        else:
            msg0 += plantilla.format(res.id, res.estudiante.nombre, res.tarea.numero)
            msg0 += "Actual --> "
            res.actualizar_avance_tarea()
            msg0 += plantilla2.format(res.avance, res.calificacion_tarea)

            msg0 += "Nueva --> "
            msg0 += plantilla2.format(res.avance, res.calificacion_tarea)
            print(msg0)
            msg += msg0
        print(msg0)

    return "OK"





@acceso_restringido(tipo_usuario=PROFESOR)
def submissions2(request):
    """
     FUNCION DE PRUEBA - DESABILITADA
    """
    from pygments.styles import get_style_by_name
    from pygments import highlight
    from pygments.lexers import PythonLexer
    from pygments.formatters import HtmlFormatter

    code = '''
def submission(request, id):
    template_name = "dashboard/submissions.html"
    context = {}
    return render(request, template_name, context)'''
    html_code = highlight(code, PythonLexer(), HtmlFormatter(cssclass="source", linenos=True, style='friendly'))


    martor_form = MartorForm()

    template_name = "dashboard/submissions.html"
    context = {"html_code": html_code,
               "martor_form": martor_form,
               "content": "# Titulo \n![awesome](http://i.imgur.com/hvguiSn.jpg) \n![https://i.blogs.es/5efe2c/cap_001/450_1000.jpg](http://i.blogs.es/5efe2c/cap_001/450_1000.jpg)"  }
    return utils.render_page(request, template_name, context)
