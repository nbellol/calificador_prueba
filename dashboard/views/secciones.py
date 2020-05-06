# -*- coding: utf-8 -*-
import uuid
import json

from django.shortcuts import get_object_or_404
from dashboard.decorators import acceso_restringido

import dashboard.utils as utils

from dashboard.models.usuarios import Usuario, Estudiante, Profesor
from dashboard.models.problemas import Tag, Problema
from dashboard.models.comentarios import Pregunta
from dashboard.models.secciones import Seccion, Curso
from dashboard.models.tareas import ResultadoTarea

from dashboard.constantes import ESTUDIANTE, PROFESOR, ADMINISTRADOR
from dashboard.forms import SeccionForm, MonitoresForm


@acceso_restringido(tipo_usuario=[PROFESOR, ADMINISTRADOR])
def analizar_seccion(request, id_seccion):
    """
    Despliega la página donde se ve el resumen de una sección
    Parámetros:
        request: la petición HTTP
        id_seccion: el identificador de la sección
    """
    # TODO Verificar que quien consulta la sección sea profesor de la seccion
    print("ANALIZANDO SECCION")
    seccion = get_object_or_404(Seccion, pk=id_seccion)
    estudiantes = seccion.estudiante_set.all().order_by("solo_apellido", "solo_nombre")
    tareas = seccion.tarea_set.all()

    # Cargar la información de los estudiantes de la sección
    resultados_estudiantes = []
    for est in estudiantes:
        tareas_estudiante = []
        for tarea in tareas:
            res_tarea = ResultadoTarea.buscar_resultado_tarea_estudiante(est.id, tarea.id)
            if res_tarea is None:
                res_tarea = ResultadoTarea.crear_resultado_tarea(est, tarea)
            res_tarea.slug = str(est.id) + str(tarea.id)
            tareas_estudiante.append(res_tarea)

        resultados_estudiantes.append((est, tareas_estudiante))

    # Cargar la información de los tags intentados por los estudiantes de la sección
    tags = Tag.buscar_tags_intentados_seccion(id_seccion)
    tuplas_tags = []
    for tag in tags:
        estadisticas = Tag.calcular_estadisticas_tag_seccion(tag.texto, id_seccion)
        # desempaquetar la tupla
        porcentaje, probs, resueltos, intentos = estadisticas
        tuplas_tags.append((tag, porcentaje, probs, resueltos, intentos))


    # Cargar la información de los problemas intentados por los estudiantes de la sección
    probs = Problema.buscar_problemas_intentados_seccion(id_seccion)
    lista_problemas = []
    for prob in probs:
        resultados = Problema.calcular_estadisticas_problema_seccion(prob.id, id_seccion)
        # desempaquetar la tupla
        efectividad, totales, exitosos, num_estudiantes, num_estudiantes_exitosos = resultados
        resultado = {"efectividad": efectividad,
                     "exitosos": exitosos,
                     "totales": totales,
                     "num_estudiantes": num_estudiantes,
                     "num_estudiantes_exitosos": num_estudiantes_exitosos}
        lista_problemas.append((prob, resultado))

    # Organizar la información para el template y renderizarlo
    template_name = "dashboard/secciones/seccion.html"
    context = {"seccion": seccion,
               "estudiantes": estudiantes,
               "tareas": tareas,
               "resultados_estudiantes": resultados_estudiantes,
               "tags": tuplas_tags,
               "lista_problemas": lista_problemas}

    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ADMINISTRADOR)
def lista_secciones(request, semestre="None"):
    """
    Despliega la página donde se ve la lista de secciones del sistema con sus principales datos
    Parámetros:
        request: la petición HTTP
        semestre: el semestre para el cual se quieren consultar las secciones
    """
    mensaje = ""
    template_name = "dashboard/secciones/secciones_sistema.html"
    if semestre == "None":
        secciones = Seccion.secciones()
    else:
        secciones = Seccion.secciones_semestre(semestre)

    context = {"secciones": secciones, "mensaje": mensaje}
    return utils.render_page(request, template_name, context)


@acceso_restringido(tipo_usuario=ADMINISTRADOR)
def nueva_seccion(request):
    """
    Despliega la página para cargar los miembros de una sección.
    Parámetros:
        request: la petición HTTP
    """
    forma = SeccionForm(request.POST or None, request.FILES or None)
    tipo_forma = str(request.POST.get("tipo_forma", None))
    mensaje = ""

    # No se envió un formulario con datos: se debe mostrar el formulario vacío
    if tipo_forma == 'None':
        template_name = "dashboard/secciones/nueva_seccion.html"
        forma = SeccionForm()
        context = {"forma": forma,
                   "mensaje": mensaje}
        return utils.render_page(request, template_name, context)

    # SÍ Se envió un formulario con datos: se debe procesar
    elif forma.is_valid():
        data = forma.cleaned_data
        semestre = data.get("semestre")
        curso = data.get("curso")
        numero_seccion = data.get("numero_seccion")
        original_filename = request.FILES['archivo_json'].name.lower()

        if original_filename.startswith("seccion"):
            numero_candidato = original_filename.split(".")[0].replace("seccion", "")
            if numero_candidato.isnumeric():
                numero_seccion = int(numero_candidato)

        noise = uuid.uuid4().hex[:16]

        file_type = "unknown"
        if original_filename.endswith(".json"):
            file_type = "json"
        elif original_filename.endswith(".csv"):
            file_type = "csv"

        filename = "seccion_" + str(numero_seccion) + noise + "." + file_type

        if file_type == "json":
            utils.handle_uploaded_json(request.FILES['archivo_json'], filename)
        else:
            utils.handle_uploaded_csv(request.FILES['archivo_json'], filename)

        archivo = open('image/' + file_type + '/' + filename, "r")
        contenido = archivo.read()
        archivo.close()

        # Crear la nueva sección
        seccion_nueva = Seccion.crear_seccion(int(numero_seccion), semestre.nombre_semestre, curso)

        if file_type == "json":
            n_estudiantes, n_profesores, repetidos = cargar_archivo_json(contenido, seccion_nueva)
        elif file_type == "csv":
            n_estudiantes, n_profesores, repetidos = cargar_archivo_csv(contenido, seccion_nueva)
        else:
            n_estudiantes, n_profesores, repetidos = (-1, -1, [])

        mensaje = "Se creó la sección {} para el semestre {} con {} estudiantes y {} profesores"
        mensaje = mensaje.format(numero_seccion, semestre, n_estudiantes, n_profesores)

        template_name = "dashboard/secciones/secciones_sistema.html"
        secciones = Seccion.secciones()

        context = {"secciones": secciones,
                   "mensaje": mensaje,
                   "repetidos": repetidos}

        return utils.render_page(request, template_name, context)

    else:
        mensaje = "Hubo un problema validando el formulario"
        return secciones(request)


@acceso_restringido(tipo_usuario=ADMINISTRADOR)
def monitores(request):
    """
    Despliega la página para cargar los monitores de todos los cursos.
    Parámetros:
        request: la petición HTTP
    """
    forma = MonitoresForm(request.POST or None, request.FILES or None)
    tipo_forma = str(request.POST.get("tipo_forma", None))
    mensaje = ""

    if tipo_forma == 'None':
        template_name = "dashboard/secciones/monitores.html"
        forma = MonitoresForm()
        context = {"forma": forma,
                   "mensaje": mensaje}
        return utils.render_page(request, template_name, context)

    elif forma.is_valid():
        data = forma.cleaned_data
        nombre_semestre = data.get("semestre")
        curso = data.get("curso")

        file_type = "csv"
        noise = uuid.uuid4().hex[:16]
        filename = "monitores_" + noise + "." + file_type
        utils.handle_uploaded_csv(request.FILES['archivo_csv'], filename)

        archivo = open('image/' + file_type + '/' + filename, "r")
        contenido = archivo.read()
        archivo.close()

        n_monitores, n_secciones, repetidos, promovidos, adicional = cargar_archivo_csv_monitores(contenido, curso, nombre_semestre)

        plantilla = "Se cargaron {} monitores para el semestre {} en {} secciones. {} ya habían sido monitores y {} eran estudiantes."
        mensaje = plantilla.format(n_monitores, nombre_semestre, n_secciones, len(repetidos), len(promovidos))
        if adicional is not None:
            mensaje += "\n" + adicional

        template_name = "dashboard/secciones/secciones_sistema.html"
        secciones = Seccion.secciones()

        context = {"secciones": secciones,
                   "mensaje": mensaje,
                   "repetidos": repetidos,
                   "promovidos": promovidos}

        return utils.render_page(request, template_name, context)

    else:
        mensaje = "Hubo un problema validando el formulario"
        return secciones(request)


def cargar_archivo_json(contenido: str, seccion: Seccion) -> tuple:
    """
    Procesa la información de un archivo JSON de Brightspace con la información de una sección.
    El archivo puede tener profesores (rol 135) y estudiantes (rol 136).
    Si hay estudiantes que ya estaban en otra sección se archivan:
        - Sus usuarios anteriores quedan con el login + _viejo
        - Sus usuarios anteriores se vuelven locales
        - Se crean nuevos usuarios
    Parámetros:
        contenido (str): El contenido del archivo JSON con la información del curso
        seccion (Seccion): La sección a la que se le están agregando los miembros
    Retorno:
      (tuple) : Una tupla con los siguientes valores
                num_estudiantes: la cantidad de estudiantes que quedaron en la sección
                num_profesores: la cantidad de profesores que quedaron en la sección
                repetidos: Una lista con los logins de los estudiantes que ya existían en el sistema
    """
    num_estudiantes = 0
    num_profesores = 0
    repetidos = []

    listado = json.loads(contenido)
    for participante in listado:
        # Extraer los datos que nos interesan
        login = participante.get('Username', 'user_name')
        nombre = participante.get('FirstName', 'nombre')
        apellido = participante.get('LastName', 'nombre')
        if login.count("@") > 0:
            login = login.split("@")[0]

        # Convertir los roles de Brightspace a los roles de Senecode
        role = participante.get("RoleId", None)
        if role is None:
            role = ESTUDIANTE
        elif role == 136:
            role = ESTUDIANTE
        elif role == 135:
            role = PROFESOR

        if role == ESTUDIANTE and Usuario.usuario_existe(login):
            # Ya existe un estudiante en el sistema con ese login
            repetidos.append(login)
            # Archivar el estudiante anterior
            usuario_antiguo = Usuario.objects.get(login__exact=login)
            archivar_usuario_estudiante(usuario_antiguo, ".viejo")
            # Crear un nuevo usuario estudiante para este semestre
            Estudiante.crear_estudiante(login, nombre, apellido, seccion)
            num_estudiantes += 1

        elif role == ESTUDIANTE:
            Estudiante.crear_estudiante(login, nombre, apellido, seccion)
            num_estudiantes += 1

        elif role == PROFESOR and Usuario.usuario_existe(login):
            # Ya existe un profesor en el sistema con ese login
            repetidos.append(login)
            usuario_antiguo = Usuario.objects.get(login__exact=login)
            if usuario_antiguo.tipo == ESTUDIANTE:
                # El profesor antes era un estudiante. Se archiva el usuario anterior
                archivar_usuario_estudiante(usuario_antiguo, ".est")
                Profesor.crear_profesor(login, nombre + " " + apellido, seccion)
            else:
                viejo_profesor = Profesor.objects.get(login__exact=login)
                viejo_profesor.agregar_seccion(nueva_seccion)
            num_profesores += 1

        elif role == PROFESOR:
            Profesor.crear_profesor(login, nombre + " " + apellido, seccion)
            num_profesores += 1

    return (num_estudiantes, num_profesores, repetidos)


def cargar_archivo_csv(contenido: str, seccion: Seccion) -> tuple:
    """
    Procesa un archivo CSV con los datos de estudiantes y profesores de una sección
    El archivo debe tener una fila con los nombres de las columnas.
    Las columnas en el archivo deben ser: Rol, Nombre, Email
    El rol puede ser "profesor" o "estudiante"
    Parámetros:
        contenido (str): El contenido del archivo CSV con la información de los monitores
        seccion (Seccion): La sección a la que se le están agregando los miembros
    Retorno:
      (tuple) : Una tupla con los siguientes valores
                num_estudiantes: la cantidad de estudiantes que quedaron en la sección
                num_profesores: la cantidad de profesores que quedaron en la sección
                repetidos: Una lista con los logins de los estudiantes que ya existían en el sistema
    """
    num_estudiantes = 0
    num_profesores = 0
    repetidos = []

    first = True
    filas = contenido.split("\n")
    for fila in filas:
        if first:
            first = False
        else:
            columns = fila.split(",")
            if len(columns) == 1:
                columns = fila.split(";")
            role = columns[0].upper()
            nombre_completo = columns[1]
            login = columns[2]

            if role == "ESTUDIANTE":
                role = ESTUDIANTE
            elif role == "PROFESOR":
                role = PROFESOR

            if login.count("@") > 0:
                login = login.split("@")[0]

            # Separar los nombres y apellidos
            nombre, apellido = separar_nombre(nombre_completo)

            if role == ESTUDIANTE and Usuario.usuario_existe(login):
                # Archivar el estudiante anterior
                usuario_antiguo = Usuario.objects.get(login__exact=login)
                archivar_usuario_estudiante(usuario_antiguo, ".viejo")
                repetidos.append(login)

                # Crear un nuevo usuario estudiante para este semestre
                Estudiante.crear_estudiante(login, nombre, apellido, seccion)
                num_estudiantes += 1

            elif role == ESTUDIANTE:
                nuevo = Estudiante.crear_estudiante(login, nombre, apellido, seccion)
                num_estudiantes += 1
                print("Nuevo estudiante creado", nuevo)

            elif role == PROFESOR and Usuario.usuario_existe(login):
                print("Ya existe un profesor en el sistema con login", login)
                repetidos.append(login)
                viejo_profesor = Profesor.objects.get(login__exact=login)
                viejo_profesor.agregar_seccion(seccion)
                num_profesores += 1

            elif role == PROFESOR:
                nuevo = Profesor.crear_profesor(login, nombre + " " + apellido, seccion)
                print("Nuevo profesor creado", nuevo)
                num_profesores += 1

    return (num_estudiantes, num_profesores, repetidos)


def cargar_archivo_csv_monitores(contenido: str, curso: Curso, semestre: str) -> tuple:
    """
    Procesa la información de un archivo CSV con los datos de los monitores para un semestre.
    El archivo debe tener una fila con los nombres de las columnas.
    Las columnas en el archivo deben ser: Número sección, Rol, Nombre, Email
    El rol deber ser "profesor".
    Parámetros:
        contenido (str): El contenido del archivo CSV con la información de los monitores
        curso (Curso): El curso para el cual se están cargando los monitores
        semestre (str): El nombre del semestre para el que se están cargando los monitores
    Retorno:
      (tuple) : Una tupla con los siguientes valores
                num_monitores: la cantidad de monitores creados
                num_secciones: la cantidad de secciones a las que se le asignó un monitor
                repetidos: Una lista con los logins de los monitores que ya eran profesores
                promovidos: Una lista con los logins de los que eran estudiantes y ahora profesores
                mensaje: Un mensaje adicional si es necesario reportar algún error inesperado
    """
    secciones = set()  # Acá van a quedar los números de las secciones
    num_monitores = 0
    repetidos = []     # Acá van a quedar los logins de los repetidos
    promovidos = []    # Acá van a quedar los logins de los promovidos
    mensaje_adicional = None  # Acá va a quedar un mensaje adicional si se requiere

    first = True
    filas = contenido.split("\n")
    for fila in filas:
        if first:
            first = False
        else:
            columns = fila.split(",")
            if len(columns) == 1:
                columns = fila.split(";")

            # Sacar los 4 datos del CSV
            num_seccion = int(columns[0])
            secciones.add(num_seccion)  # secciones es un conjunto
            role = columns[1].upper()
            if role == "PROFESOR":
                role = PROFESOR
            nombre_completo = columns[2]
            login = columns[3]
            if login.count("@") > 0:
                login = login.split("@")[0]

            # Separar los nombres y apellidos
            nombre, apellido = separar_nombre(nombre_completo)

            # Buscar la sección a la que se va a agregar el monitor
            seccion = Seccion.buscar_seccion(curso, semestre, num_seccion)

            if seccion is None:
                mensaje_adicional = "No se encontró la sección {}. ".format(num_seccion)

            else:
                # El monitor es alguien que ya conocíamos
                if role == PROFESOR and Usuario.usuario_existe(login):
                    usuario_antiguo = Usuario.objects.get(login__exact=login)
                    if usuario_antiguo.tipo == ESTUDIANTE:
                        archivar_usuario_estudiante(usuario_antiguo, ".est")
                        nuevo = Profesor.crear_profesor(login, nombre + " " + apellido, seccion)
                        promovidos.append(login)
                    else:
                        repetidos.append(login)
                        viejo_profesor = Profesor.objects.get(login__exact=login)
                        viejo_profesor.agregar_seccion(seccion)

                # El monitor es un desconocido
                elif role == PROFESOR:
                    nuevo = Profesor.crear_profesor(login, nombre + " " + apellido, seccion)
                    print("Nuevo profesor creado", nuevo)


            num_monitores += 1

    return (num_monitores, len(secciones), repetidos, promovidos, mensaje_adicional)


def archivar_usuario_estudiante(usuario_antiguo: Usuario, extension: str = ".est") -> None:
    """
       Le cambia el login a un usuario existente y lo convierte en un usuario local.
       El password del usuario se cambia por su mismo login.
       Parámetros:
           usuario_antiguo (Usuario): El usuario que se va a modificar
           extension (str): La extensión que se va a agregar al login del estudiante
    """
    login = usuario_antiguo.login

    if Usuario.usuario_existe(login + extension):
        extension = extension + uuid.uuid4().hex[:16]

    usuario_antiguo.login = login + extension
    usuario_antiguo.usuario_local = True
    usuario_antiguo.save()
    usuario_antiguo.cambiar_password(usuario_antiguo.login)


@acceso_restringido(tipo_usuario=PROFESOR)
def preguntas_estudiante(request, id_estudiante):
    """
       Mostrar la lista de preguntas de un estudiante ...
    """
    estudiante = get_object_or_404(Estudiante, pk=id_estudiante)
    preguntas = Pregunta.buscar_preguntas_estudiante(estudiante.id)

    template_name = "dashboard/secciones/preguntas_estudiante.html"

    context = {"est": estudiante, "preguntas_estudiante": preguntas}
    return utils.render_page(request, template_name, context)


def separar_nombre(nombre_completo: str) -> tuple:
    """
    Esta función intenta separar el nombre de una persona en el nombre y el apellido.
    Parámetros:
        nombre_completo (str): El nombre completo de la persona
    Retorno:
        (tuple) : Retorna una tupla donde en la primera posición está
                  el nombre y en la segunda posición está el apellido
    """
    nombre = nombre_completo
    apellido = nombre_completo

    partes_nombre = nombre_completo.split()
    if len(partes_nombre) == 4:
        nombre = " " .join(partes_nombre[:2])
        apellido = " " .join(partes_nombre[-2:])
    elif len(partes_nombre) == 3:  # Suponemos que es más común tener dos apellidos que dos nombres
        nombre = partes_nombre[0]
        apellido = " " .join(partes_nombre[-2:])
    elif len(partes_nombre) == 2:
        nombre = partes_nombre[0]
        apellido = partes_nombre[1]
    elif len(partes_nombre) > 4:
        nombre = " " .join(partes_nombre[:2])
        apellido = " " .join(partes_nombre[2:]).capitalize()

    return nombre, apellido
