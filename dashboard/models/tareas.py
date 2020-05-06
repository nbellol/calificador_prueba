# -*- coding: utf-8 -*-
import dashboard.locale_bogota as local
import datetime

from django.db import models

from dashboard.models.envios import Envio, crear_resultado_estudiante, ResultadoEstudiante


class Tarea(models.Model):
    descripcion = models.CharField(max_length=100, default="Tarea", null=True, blank=True)
    numero = models.IntegerField(default=1)
    fecha_limite = models.DateTimeField()
    seccion = models.ForeignKey('dashboard.Seccion', null=True, on_delete=models.SET_NULL)
    problemas = models.ManyToManyField('dashboard.Problema')


    def __str__(self):
        return "Tarea " + str(self.numero) + ": sección " + str(self.seccion.numero)

    @property
    def fecha_formateada(self):
        limite = self.fecha_limite.astimezone(local.bogota)
        fecha = limite.strftime("%A %d de %B - %I:%M %p")
        return fecha

    def buscar_tareas_seccion(id_seccion):
        resultado = Tarea.objects.filter(seccion_id=id_seccion)
        return resultado

    @property
    def vencida(self):
        now = datetime.datetime.now()
        now = local.bogota.localize(now)
        return now > self.fecha_limite



class ResultadoTarea(models.Model):
    tarea = models.ForeignKey('dashboard.Tarea', null=True, on_delete=models.SET_NULL)
    estudiante = models.ForeignKey('dashboard.Estudiante', null=True, on_delete=models.SET_NULL)
    calificacion_tarea = models.FloatField(default=0)
    avance = models.FloatField(default=0)
    puntos = models.IntegerField(default=0)

    def __str__(self):
        return str(self.id) + ":" + str(self.tarea) + "-" + str(self.estudiante) + "-" +  str(self.avance) + "/" + str(self.puntos)

    def parejas_tarea_resultado(estudiante, todas=True):
        """ Este método construye una lista de parejas con las tareas que tiene el estudiante.
            Cada pareja es una tupla: (Tarea, ResultadoTarea )
        """
        lista_parejas = []
        lista_tareas = Tarea.buscar_tareas_seccion(estudiante.seccion_id).order_by("-fecha_limite")

        for tarea in lista_tareas:
            resultado = ResultadoTarea.buscar_resultado_tarea_estudiante(estudiante.id, tarea.id)
            if resultado is None:
                resultado = ResultadoTarea.crear_resultado_tarea(estudiante, tarea)
            resultado.actualizar_resultado_tarea()

            if todas or resultado.avance < 100:
                lista_parejas.append((tarea, resultado))

        return lista_parejas

    def buscar_resultado_tarea_estudiante(id_estudiante, id_tarea):
        resultado = ResultadoTarea.objects.filter(estudiante_id=id_estudiante, tarea=id_tarea).first()
        return resultado

    def buscar_resultados_tarea(id_tarea):
        resultado = ResultadoTarea.objects.filter(tarea=id_tarea)
        return resultado

    def buscar_estadisticas_tarea_rapida(tarea):
        resultados = tarea.resultadotarea_set.all()
        problemas_ids = tarea.problemas.values_list('id', flat=True)

        terminaron = 0
        empezaron = 0
        siguen_en_0 = 0
        sin_empezar = 0
        avance = 0
        cantidad = 0

        for res_tarea in resultados:
            cantidad += 1
            avance += res_tarea.avance

            if res_tarea.avance == 100:
                # Ya terminó, así que no nos importa nada más
                terminaron += 1
            elif res_tarea.avance > 0:
                # Ya arrancó, así que no necesitamos saber nada más
                empezaron += 1
            else:
                # No sabemos si ha arrancado, así que tenemos que consultar por problema
                estudiante = res_tarea.estudiante
                empezo = False

                resultados_estudiante = ResultadoEstudiante.buscar_resultados_estudiante(estudiante.id)
                for re in resultados_estudiante:
                    prob_id = re.problema_id
                    if prob_id in problemas_ids and re.ultimo_intento is not None:
                        empezo = True
                if empezo:
                    siguen_en_0 += 1
                else:
                    sin_empezar += 1

        p_terminaron = int(terminaron/cantidad*100)
        p_empezaron = int(empezaron/cantidad*100)
        p_siguen0 = int(siguen_en_0/cantidad*100)
        p_sin_empezar = 100 - p_terminaron - p_empezaron - p_siguen0

        estadisticas = [p_terminaron, p_empezaron, p_siguen0, p_sin_empezar]
        etiquetas = ["", "", "", ""]
        if terminaron > 0:
            etiquetas[0] = "Terminaron: " + str(terminaron)

        if empezaron > 0:
            etiquetas[1] = "En progreso: " + str(empezaron)

        if siguen_en_0 > 0:
            etiquetas[2] = "Empezaron pero están en 0: " + str(siguen_en_0)

        if sin_empezar > 0:
            etiquetas[3] = "No han empezado: " + str(sin_empezar)

        avance_total = 0 if cantidad == 0 else avance/cantidad

        return {'avance': avance_total, "valores": estadisticas, "etiquetas": etiquetas, "total": cantidad}

    def buscar_estadisticas_tarea(id_tarea):
        resultados = ResultadoTarea.objects.filter(tarea=id_tarea)
        terminaron = 0
        empezaron = 0
        siguen_en_0 = 0
        sin_empezar = 0
        avance = 0
        cantidad = len(resultados)

        problemas = None

        for res_tarea in resultados:
            if problemas is None:
                problemas = res_tarea.tarea.problemas.all()

            avance += res_tarea.avance
            res_problemas = res_tarea.problemas_tarea_rapido(problemas)

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


        estadisticas = [int(terminaron), int(empezaron), int(siguen_en_0), int(sin_empezar)]
        etiquetas = ["", "", "", ""]
        if terminaron > 0:
            etiquetas[0] = "Terminaron: " + str(terminaron)

        if empezaron > 0:
            etiquetas[1] = "En progreso: " + str(empezaron)

        if siguen_en_0 > 0:
            etiquetas[2] = "Empezaron pero están en 0: " + str(siguen_en_0)

        if sin_empezar > 0:
            etiquetas[3] = "No han empezado: " + str(sin_empezar)

        avance_total = 0 if cantidad == 0 else avance/cantidad

        return {'avance': avance_total, "valores" : estadisticas, "etiquetas": etiquetas, "total": cantidad}


    def crear_resultado_tarea(estudiante, tarea):
        """
        Crea un nuevo resultado para un estudiante y una tarea específica.
        Esta función existe por la restricción de django para sobrecargar los
        constructores de las entidades.
        """
        resultado = ResultadoTarea()
        resultado.tarea = tarea
        resultado.estudiante = estudiante
        resultado.puntos = 0
        resultado.avance = 0
        resultado.calificacion_tarea = 0
        resultado.save()
        return resultado

    @property
    def avance2(self):
        return self.avance

    @property
    def terminada(self):
        return self.avance == 100

    @property
    def terminada_tarde(self):
        # TODO revisar si se terminó tarde
        return self.avance == 100

    @property
    def incompleta(self):
        return self.avance < 100

    @property
    def problemas_tarea(self):
        """
        Construye una lista de parejas (Problema, ResultadoProblema), donde los
        problemas que aparecen son los problemas que hacen parte de la tarea
        y los resultados son los del estudiante al que pertence "este" objeto
        ResultadoTarea.
        """
        parejas = list()
        problemas = self.tarea.problemas.all()
        for problema in problemas:
            resultado = problema.buscar_resultado_problema_estudiante(self.estudiante.id)
            if resultado is None:
                resultado = crear_resultado_estudiante(self.estudiante, problema)
            parejas.append((problema, resultado))
        return parejas




    def actualizar_avance_tarea(self):
        estudiante = self.estudiante
        problemas = self.tarea.problemas.all()
        fecha_limite = self.tarea.fecha_limite
        num_problemas = len(problemas)
        completados = 0
        calificacion_tarea = 0

        for problema in problemas:
            envios = Envio.buscar_envios_problema_estudiante(estudiante.id, problema.id)
            mayor_avance = 0

            for envio in envios:
                fecha_envio = envio.timestamp
                a_tiempo = fecha_envio < fecha_limite
                avance_envio = envio.avance
                # print("Revisando", envio, a_tiempo, avance_envio, self.tarea)

                if a_tiempo and avance_envio > mayor_avance:
                    mayor_avance = avance_envio

            if mayor_avance == 100:
                completados += 1
            calificacion_tarea += mayor_avance / num_problemas

        self.avance = completados / num_problemas * 100
        self.calificacion_tarea = int(round(calificacion_tarea,0))
        self.save()


    def actualizar_resultado_tarea_envio(envio):
        """
        Si el envio hace parte de una tarea, se actualiza el resultado de la tarea para el estudiante.
        """
        print("actualizando resultado desde envio ...")

        problema_envio = envio.problema
        estudiante = envio.estudiante
        seccion = estudiante.seccion

        tareas = problema_envio.tarea_set.filter(seccion=seccion)
        if len(tareas)==0:
            print("El problema no hace parte de ninguna tarea ...")
        else:
            print("El problema es parte de una tarea y vamos actualizar el resultado")
            tarea = tareas[0]
            res_tarea = ResultadoTarea.objects.filter(tarea_id=tarea.id, estudiante_id=estudiante.id)
            if len(res_tarea) > 0:
                res_tarea[0].actualizar_avance_tarea()



    def actualizar_resultado_tarea(self):
        """
        Actualiza el resultado de una tarea para un estudiante, revisando los
        resultados de los problemas que hacen parte de la tarea.
        """
        print("actualizando resultado (original) ... esto ya no hace nada")

        #problemas = self.tarea.problemas.all()
        #completados = 0
        #total = 0
        #puntos = 0
        #for problema in problemas:
        #    resultado = problema.buscar_resultado_problema_estudiante(self.estudiante.id)
        #    total += 1
        #    if resultado is not None and resultado.resuelto:
        #        completados += 1
        #        puntos += resultado.puntos
        # self.avance = completados / total * 100
        # self.puntos = puntos
        # self.save()
