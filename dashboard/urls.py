# pylint: disable=line-too-long, import-error, no-else-return
"""
Este módulo define todos los urls de la aplicación "dashboard".
"""
from django.urls import path

import dashboard.views.autenticacion as auth
import dashboard.views.homes as homes
import dashboard.views.perfiles as perfiles
import dashboard.views.problemas as pr
import dashboard.views.submissions as subs
import dashboard.views.tareas as tareas
import dashboard.views.estadisticas as stats
import dashboard.views.notificaciones as notif
import dashboard.views.secciones as secc
import dashboard.views.endpoint as ep
import dashboard.views.retos as ret

urlpatterns = [
    path('', auth.login, name="initial"),
    path('login/', auth.login, name="login"),
    path('logout/', auth.logout, name="logout"),
    path('home/', homes.home, name="home"),
    path('contactenos/', homes.contactenos, name="contactenos"),
    path('tutorial/', homes.tutorial, name="tutorial"),
    path('faq/', homes.faq, name="faq"),
    path('ajax/estudiantes_seccion/<int:id_seccion>/', homes.ajax_estudiantes_seccion, name="estudiantes_seccion"),

    path('perfil/', perfiles.perfil, name="perfil"),
    path('perfil_pwd/', perfiles.cambiar_password, name="password"),
    path('perfil_alias/', perfiles.cambiar_alias, name="alias"),
    path('estudiante/analisis/<int:id_estudiante>', stats.analisis_estudiante, name="analisis_estudiante"),

    path('problemas/', pr.problemas, name="problemas"),
    path('problemas/buscar', pr.buscar_problemas, name="buscar_problemas"),
    path('problemas/buscara', pr.buscar_problemas_avanzada, name="buscar_problemas_avanzado"),
    path('problemas/<str:slug>/', pr.problema, name="problema"),
    path('problemas/autor/<int:id_autor>/', pr.problemas_autor, name="problemas_autor"),
    path('problemas/new', pr.problema_nuevo, name="problema_nuevo"),
    path('tags/<int:tag_id>/', pr.buscar_por_tag, name="buscar_tag"),

    path('problemas/admin/<str:slug>/', pr.solucion_referencia, name="administrar"),

    path('preguntas/prof/<int:id_autor>/', pr.problemas_autor, name="preguntas_estudiantes"),
    path('preguntas/est/<int:id_estudiante>/', secc.preguntas_estudiante, name="preguntas_estudiante"),

    path('retos/<int:nivel>/', ret.retos, name="retos"),
    path('retos/new/', ret.nuevo_reto, name="nuevo_reto"),

    path('envios/', subs.submissions, name="envios"),
    path('envios_p/', subs.submissions_pendientes, name="envios_pendientes"),
    path('envios_e/', subs.submissions_exitosos, name="envios_exitosos"),
    path('envios/<str:slug>/', subs.submission, name="envio"),
    path('envios_pr/<str:slug>/', subs.submission_estudiante, name="envio_estudiante"),
    path('envios/<str:slug_problema>/new/', subs.new_submission, name="nuevo_envio"),

    path('envios_est_prob/<int:id_estudiante>/<str:slug>/', subs.analisis_est_prob, name="analisis estudiante problema"),
    path('envios_est_tag/<int:id_estudiante>/<str:tag>/', subs.analisis_est_tag, name="analisis estudiante tag"),
    path('envios_est_tag/<str:slug>/<int:id_tarea>/', subs.analisis_prob_tarea, name="analisis problema tarea"),
    path('envios_secc_tag/<int:id_seccion>/<str:tag>/', subs.analisis_seccion_tag, name="analisis seccion tag"),
    path('envios_secc_prob/<int:id_seccion>/<str:slug>/', subs.analisis_seccion_prob, name="analisis seccion problema"),

    path('tareas/', tareas.tareas, name="tareas"),
    path('tareas/pendientes/', tareas.tareas_pendientes, name="tareas_pendientes"),
    path('tareas/<int:id_tarea>/', tareas.tarea, name="tarea"),
    path('tareas_propias/', tareas.tareas_propias, name="mis_tareas"),
    path('tareas/new/', tareas.tarea_nueva, name="tarea_nueva"),
    path('tareas/newc/', tareas.tarea_nueva_crear, name="tarea_nueva_crear"),
    path('tareas/analisis/<int:id_tarea>/', tareas.analisis_tarea, name="analisis_tarea"),
    path('tareas/csv/<int:id_tarea>/', tareas.csv_tarea, name="csv_tarea"),
    # path('tareas/<int:id_tarea>/', tareas.tarea_nueva, name="tarea_nueva"),
    path('tareas_panic/', subs.panic, name="tareas_panic"),

    path('secciones/<str:semestre>/', secc.lista_secciones, name="secciones"),
    path('seccion/new/', secc.nueva_seccion, name="nueva_seccion"),
    path('seccion/monitores/', secc.monitores, name="monitores"),
    path('seccion/analisis/<int:id_seccion>/', secc.analizar_seccion, name="analizar_seccion"),

    path('medallas/', stats.logros, name="medallas"),
    path('estadisticas/', stats.estadisticas, name="estadisticas"),
    path('estadisticas_propias/', stats.estadisticas_propias, name="mis_estadisticas"),
    path('estadisticas_estudiante/<int:id_estudiante>/', stats.estadisticas_estudiante, name="estadisticas_est"),
    path('estadisticas_problema/<str:slug_problema>/', stats.estadisticas_problema, name="estadisticas_pr"),

    path('notificaciones/', notif.notificaciones, name="notificaciones"),
    path('notificaciones/leidas/', notif.marcar_leidas, name="marcar_leidas"),

    path('revision/<str:slug_envio>/', ep.revisar_envio, name="revisar_envio"),
]
