from django.contrib import admin

from dashboard.models.usuarios import Usuario, Estudiante, Profesor, Monitor, Registro
from dashboard.models.secciones import Curso, CursoSemestre, Seccion
from dashboard.models.problemas import Tag, Problema, Argumento, Prueba, PruebaScript, PruebaIO
from dashboard.models.envios import ResultadoEstudiante, Envio, ResultadoPrueba
from dashboard.models.comentarios import Pregunta, ComentarioProblema, ComentarioPregunta
from dashboard.models.notificaciones import Notificacion
from dashboard.models.logros import Medalla, Logro
from dashboard.models.workers import Revision, Worker
from dashboard.models.tareas import Tarea, ResultadoTarea


admin.site.register(Usuario)
admin.site.register(Estudiante)
admin.site.register(Profesor)
admin.site.register(Monitor)
admin.site.register(Registro)

admin.site.register(Curso)
admin.site.register(CursoSemestre)
admin.site.register(Seccion)

admin.site.register(Tag)
admin.site.register(Problema)
admin.site.register(Argumento)
admin.site.register(Prueba)
admin.site.register(PruebaScript)
admin.site.register(PruebaIO)

admin.site.register(Pregunta)
admin.site.register(ComentarioProblema)
admin.site.register(ComentarioPregunta)

admin.site.register(Envio)
admin.site.register(ResultadoPrueba)
admin.site.register(ResultadoEstudiante)

admin.site.register(Tarea)
admin.site.register(ResultadoTarea)

admin.site.register(Notificacion)

admin.site.register(Medalla)
admin.site.register(Logro)

admin.site.register(Revision)
admin.site.register(Worker)
