def desperdicio_de_gaseosa(amigo_1: dict, amigo_2: dict, amigo_3: dict, capacidad_boton: float)->str:
    """ Ida al Cine
    Parámetros:
      amigo_1 (dict): Un diccionario con las siguientes llaves: "nombre", el nombre del amigo, (str)
                      "capacidad_vaso", la capacidad máxima de su vaso, (float) "capacidad_actual", la
                      capacidad que ha sido llenada de su vaso hasta el momento (float)
      amigo_2 (dict): Un diccionario con las siguientes llaves: "nombre", el nombre del amigo, (str)
                      "capacidad_vaso", la capacidad máxima de su vaso, (float) "capacidad_actual", la
                      capacidad que ha sido llenada de su vaso hasta el momento (float)
      amigo_3 (dict): Un diccionario con las siguientes llaves: "nombre", el nombre del amigo, (str)
                      "capacidad_vaso", la capacidad máxima de su vaso, (float) "capacidad_actual", la
                      capacidad que ha sido llenada de su vaso hasta el momento (float)
      capacidad_boton (float): La cantidad de gaseosa que se servirá si los amigos deciden oprimir el botón
                               correspondiente.
    Retorno:
      str: El nombre del amigo a quien se le riega primero la gaseosa, suponiendo un orden ascendente en cuanto
           a que amigo llena primero su vaso. (Es decir, primero llena el amigo_1, luego el 2, luego el 3) Si a
           ningun amigo se le riega la gaseosa, retorne None. Si a más de un amigo se le riega la gaseosa,
           retorna el primero.
    """
    return amigo_1["nombre"]