# -*- coding: utf-8 -*-
from django.shortcuts import HttpResponse
from dashboard.models.envios import Envio
from dashboard.models.tareas import ResultadoTarea

from dashboard.constantes import CORRECTO, INCORRECTO

def revisar_envio(request, slug_envio):
    """ Esta es la función que se debe invocar cuando se termina de revisar
        un envío de un usuario y depende del slug de un envío.
        Si se invoca dos veces para el mismo envío, y el envío no ha cambiado,
        no debería haber cambios en el resto del sistema.
    """
    envio = None

    try:
        envio = Envio.objects.get(slug=slug_envio)
        print("Se va a revisar el envio {}".format(slug_envio))
    except:
        pass

    if envio is not None:
        avance = 0
        res_estudiante = envio.resultado_estudiante # Resultado del estudiante ya registrado para el problema del envío
        problema_resuelto = res_estudiante.resuelto # Lo que ya estaba registrado sobre el problema
        dificultad = envio.problema.dificultad
        num_pruebas = envio.problema.prueba_set.all().count()
        num_intentos = envio.numero # esta es la cantidad incluyendo al envío en revisión

        resultados_prueba = envio.consultar_resultados_pruebas # Lo que los workers dejaron registrado
        envio_exitoso = True
        for resultado in resultados_prueba:
            if not resultado.resultado_exitoso:
                print("Hay una prueba que no fue exitosa, el envio {} no es aceptable".format(slug_envio))
                envio_exitoso = False
            else:
                avance += 100 * resultado.prueba.peso

        print("El envío {} fue exitoso=={}".format(slug_envio, envio_exitoso))
        if envio_exitoso and not problema_resuelto: # Esta condición verifica tanto el envío actual como el resultado ya almacenado.
                                                    # De esta forma evitamos volver a entregar puntos sobre problemas resueltos.
            print("El envío {} fue exitoso y el usuario no había resuelto el problema antes".format(slug_envio))
            avance = 100 # Si el problema está resuelto, se fuerza 100 para evitar problemas de redondeo o inconsistencias en los pesos
            puntos_envio = calcular_puntos(dificultad, num_pruebas, num_intentos)
            res_estudiante.resuelto = True
            res_estudiante.puntos = puntos_envio
            res_estudiante.save()
            res_estudiante.estudiante.puntos += puntos_envio
            res_estudiante.estudiante.save()

        elif envio_exitoso and problema_resuelto: # El problema ya estaba resuelto, pero igual el envio debe quedar con información consistente
            print("El envío {} fue exitoso PERO el usuario YA había resuelto el problema antes".format(slug_envio))
            avance = 100
            puntos_envio = calcular_puntos(dificultad, num_pruebas, num_intentos)
            puntos_actuales = res_estudiante.puntos
            if puntos_actuales < puntos_envio: # Esto se incluye en caso de que haya una recalificación y permite subir los puntos
                delta = puntos_envio - puntos_actuales
                res_estudiante.puntos = puntos_envio
                res_estudiante.save()
                res_estudiante.estudiante.puntos += delta
                res_estudiante.estudiante.save()

        envio.avance = avance
        envio.estado = CORRECTO if envio_exitoso else INCORRECTO
        envio.save()
        ResultadoTarea.actualizar_resultado_tarea_envio(envio)
    else:
        print("No encontré el envío")

    return HttpResponse("OK")


def calcular_puntos(dificultad, num_pruebas, num_intentos):
    """ Esta es la función que calcula la cantidad de puntos (p) entregados a un usuario
        que resuelve un problema dada la dificultad (d), la cantidad de pruebas disponibles (npr)
        para el problema y el número de intentos (ni) realizados hasta que se resolvió el problema.
        
        La fórmula es:
            p = d - ((d/npr+3) * (ni - 1)
            
        Esta fórmula busca que:
            Si se resuelve al primer intento, se entreguen d puntos.
            Cada intento adicional disminuya la cantidad de puntos.
            La cantidad de puntos decrece menos rápido que lo que crece la cantidad de intentos.
            
        Finalmente, la cantidad de puntos se redondea al entero más cercano.
    """
    puntos = dificultad - ((dificultad/(num_pruebas+3)) * (num_intentos - 1))
    return max(int(round(puntos, 0)), 0)