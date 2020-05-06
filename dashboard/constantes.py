# -*- coding: utf-8 -*-

EXTENSIONES = ['.jpg', '.gif', '.png']


ADMINISTRADOR = 'AD'
PROFESOR = 'PR'
ESTUDIANTE = 'ES'
MONITOR = 'MO'


TIPO_USUARIO = [(ADMINISTRADOR, 'Administrador'),
                (PROFESOR, 'Profesor'),
                (ESTUDIANTE, 'Estudiante'),
                (MONITOR, 'Monitor')]

NINGUNO = 'N'
BASICO = 'B'
MEDIO = 'M'
AVANZADO = 'A'

NIVEL_RETO = [(NINGUNO, 'Ninguno'),
                (BASICO, 'Básico'),
                (MEDIO, 'Intermedio'),
                (AVANZADO, 'Avanzado')]


TIPOS_PREGUNTAS = [
    ('Aclaracion', 'Aclaración del enunciado'),
    ('Ayuda', 'Ayuda para la solución'),
    ('Error', 'Error en el enunciado'),
    ('Bug', 'Error en los casos de prueba')
]

NIVELES = [
    ('1', 'Nivel 1'),
    ('2', 'Nivel 2'),
    ('3', 'Nivel 3'),
    ('4', 'Nivel 4'),
    ('0', 'Todos')
]

DIFICULTADES = [
    ('0', '1 a 10'),
    ('10', '11 a 20'),
    ('20', '21 a 30'),
    ('30', '31 a 40'),
    ('40', '41 a 50'),
    ('50', 'Todas')
]



NUEVO = "NU"
INCORRECTO = "ER"
CORRECTO = "OK"

ESTADO_ENVIO = [(NUEVO, 'Nuevo'),
                (INCORRECTO, 'Incorrecto'),
                (CORRECTO, 'Correcto')]


ENTRADA_SALIDA = "IO"
SCRIPT = "OK"

TIPO_PRUEBA = [(SCRIPT, 'Script'),
               (ENTRADA_SALIDA, 'Entrada/Salida')]


MENSAJE = "ME"
RESPUESTA = "RE"
ENVIO_RECIBIDO = "EE"
ENVIO_REVISADO = "ER"
TAREA_DISPONIBLE = "TD"
TAREA_TERMINADA = "TT"
TRABAJO_DISPONIBLE = "WD"
PREGUNTA_ESTUDIANTE = "PE"
PREGUNTA_PROBLEMA = "PP"
LOGRO = "LO"

TIPO_NOTIFICACION = [
        (MENSAJE, 'Mensaje recibido'),
        (RESPUESTA, 'Nueva respuesta a pregunta'),
        (ENVIO_RECIBIDO, 'Un nuevo envío fue recibido'),
        (ENVIO_REVISADO, 'Envío revisado'),
        (TAREA_DISPONIBLE, 'Nueva tarea Disponible'),
        (TAREA_TERMINADA, 'Se completaron todos los problemas de una tarea'),
        (TRABAJO_DISPONIBLE, 'Trabajo en clase disponible'),
        (PREGUNTA_ESTUDIANTE, 'Un estudiante de su sección dejó una pregunta'),
        (PREGUNTA_PROBLEMA, 'Hay una nueva pregunta para uno de sus problemas'),
        (LOGRO, 'Medalla otorgada')]
