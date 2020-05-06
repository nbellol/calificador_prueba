# -*- coding: utf-8 -*-
import csv
from django.shortcuts import get_object_or_404
from django.http import HttpResponse

import dashboard.utils as utils
from dashboard.decorators import acceso_restringido
from dashboard.constantes import PROFESOR, ESTUDIANTE
from dashboard.models.tareas import Tarea, ResultadoTarea
from dashboard.models.problemas import Problema
from dashboard.forms import NuevaTareaForma

@acceso_restringido(tipo_usuario=ESTUDIANTE)
def tareas(request, todas=True, titulo="Lista de tareas"):
    """
       Muestra las tareas de un estudiante, usando el template 'tareas.html'
       Si el párametro todas es verdadero se muestran todas las tareas.
       De lo contrario se muestran sólo las tareas pendientes.
    """
    estudiante = utils.reconstruir_estudiante(request)
    lista_parejas = ResultadoTarea.parejas_tarea_resultado(estudiante, todas)
    template_name = "dashboard/tareas/tareas.html"
    context = {"lista_tareas": lista_parejas, "titulo": titulo}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def tareas_pendientes(request):
    """
        Muestra sólo las tareas del estudiante que están pendientes
    """
    return tareas(request, todas=False, titulo="Tareas pendientes")


@acceso_restringido(tipo_usuario=ESTUDIANTE)
def tarea(request, id_tarea):
    """
        Muestra los detalles de una tarea, usando el template tarea.html
    """
    tarea = get_object_or_404(Tarea, pk=id_tarea)
    estudiante = utils.reconstruir_estudiante(request)

    resultado = ResultadoTarea.buscar_resultado_tarea_estudiante(estudiante.id, tarea.id)
    resultado.actualizar_resultado_tarea()

    template_name = "dashboard/tareas/tarea.html"
    context = {"tarea": tarea, "resultado_tarea": resultado}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=PROFESOR)
def tareas_propias(request):
    """
       Muestra todas las tareas de todas las secciones del profesor.
       Para cada sección se calcula el avance de los estudiantes.
    """
    profesor = utils.reconstruir_profesor(request)
    # lista_parejas = profesor.buscar_tareas_profesor()
    lista_parejas = profesor.buscar_tareas_profesor_con_estadisticas()

    template_name = "dashboard/tareas/tareas_profesor.html"
    context = {"lista_tareas": lista_parejas, "titulo": "Tareas de mis secciones"}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=PROFESOR)
def tarea_nueva(request):
    """
       Mostrar la forma para crear una nueva tarea, usando la plantilla
       'tarea_nueva.html'
    """
    profesor = utils.reconstruir_profesor(request)
    forma = NuevaTareaForma(profesor.buscar_secciones_profesor())
    # ESTO NO FUNCIONA forma.fields['problemas'].initial=list(Problema.objects.all())

    template_name = "dashboard/tareas/tarea_nueva.html"
    context = {"id_tarea": None, "forma": forma}
    return utils.render_page(request, template_name, context)

@acceso_restringido(tipo_usuario=PROFESOR)
def tarea_nueva_crear(request):
    """
       Crear una nueva tarea y muestra el resultado usando analisis_tarea
    """
    profesor = utils.reconstruir_profesor(request)
    print(request.POST)
    forma_simple = NuevaTareaForma(profesor.buscar_secciones_profesor(), request.POST or None)
    if forma_simple.is_valid():
        print("forma valida")
        terminos_busqueda = forma_simple.cleaned_data.get('terminos')
        forma = NuevaTareaForma(profesor.buscar_secciones_profesor())
        mensaje = None
    else:
        print("INVALIDA!!!", forma_simple.errors)
        forma = forma_simple
        mensaje = forma_simple.errors

    template_name = "dashboard/tareas/tarea_nueva.html"
    context = {"id_tarea": None, "forma": forma, "mensaje": mensaje}
    return utils.render_page(request, template_name, context)



@acceso_restringido(tipo_usuario=PROFESOR)
def csv_tarea(request, id_tarea):
    """
       Construir un archivo CSV con las calificaciones de la tarea.
       Primero se buscan los estudiantes de la sección y para cada uno se
       actualiza el resultado de la tarea (por si no ha hecho una entrega).
       Finalmente se arma el CSV usando la librería csv y se retorna.
    """
    tarea = get_object_or_404(Tarea, pk=id_tarea)
    seccion = tarea.seccion
    estudiantes = seccion.estudiante_set.all().order_by("solo_apellido", "solo_nombre")
    resultados = []
    for estudiante in estudiantes:
        res_tarea = ResultadoTarea.objects.filter(tarea_id=tarea.id, estudiante_id=estudiante.id)
        if len(res_tarea) > 0:
            resultado = res_tarea[0]
        else:
            resultado = Tarea.crear_resultado_tarea(estudiante, tarea)
        resultado.actualizar_avance_tarea()
        resultados.append(resultado)

    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="tarea_{}.csv"'.format(tarea.numero)

    writer = csv.writer(response)
    writer.writerow(['Login', 'Nombre', 'Nota sobre 100', 'Nota sobre 5'])

    for res in resultados:
        est = res.estudiante
        cal = res.calificacion_tarea
        writer.writerow([est.login, est.nombre, cal, cal/20])

    return response


@acceso_restringido(tipo_usuario=PROFESOR)
def analisis_tarea(request, id_tarea):
    """
       Mostrarle al profesor el comportamiento de su sección para una tarea específica.
       La plantilla utilizada es 'tareas_analisis.html'
    """
    tarea = get_object_or_404(Tarea, pk=id_tarea)
    profesor = utils.reconstruir_profesor(request)

    terminaron = 0
    empezaron = 0
    siguen_en_0 = 0
    sin_empezar = 0

    problemas = tarea.problemas.all()
    for i, pr in enumerate(problemas):
        pr.numero = i + 1

    resultados_estudiantes = []
    seccion = tarea.seccion
    estudiantes = seccion.estudiante_set.all().order_by("solo_apellido", "solo_nombre")
    for est in estudiantes:
        res_tarea = ResultadoTarea.buscar_resultado_tarea_estudiante(est.id, id_tarea)
        if res_tarea is None:
            res_tarea = ResultadoTarea.crear_resultado_tarea(est, tarea)
        res_problemas = res_tarea.problemas_tarea
        resultados_estudiantes.append((est, res_tarea, res_problemas))

        if res_tarea.avance == 100:
            terminaron += 1
        elif res_tarea.avance > 0:
            empezaron += 1
        else:
            empezo = False
            for problema, res_problema in res_problemas:
                if res_problema.cantidad_envios_actual > 0:
                    empezo = True
            if empezo:
                siguen_en_0 += 1
            else:
                sin_empezar += 1

    colores_base = ["#24ba45", "#C9DD28", "#D95C5C", "#989898"]
    colores = []
    estadisticas = []
    etiquetas = []
    if terminaron > 0:
        etiquetas.append("Terminaron: " + str(terminaron))
        colores.append(colores_base[0])
        estadisticas.append(terminaron)

    if empezaron > 0:
        etiquetas.append("En progreso: " + str(empezaron))
        colores.append(colores_base[1])
        estadisticas.append(empezaron)

    if siguen_en_0 > 0:
        etiquetas.append("Empezaron pero están en 0: " + str(siguen_en_0))
        colores.append(colores_base[2])
        estadisticas.append(siguen_en_0)

    if sin_empezar > 0:
        etiquetas.append("No han empezado: " + str(sin_empezar))
        colores.append(colores_base[3])
        estadisticas.append(sin_empezar)

    template_name = "dashboard/tareas/tareas_analisis.html"
    context = {"tarea": tarea,
               "problemas_tarea": problemas,
               "resultados_estudiantes": resultados_estudiantes,
               "estadisticas": estadisticas,
               "etiquetas": etiquetas,
               "colores": colores}

    return utils.render_page(request, template_name, context)
