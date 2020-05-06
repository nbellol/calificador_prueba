def es_primo(numero: int)->bool:
    """ Encontrar si un número es Primo
    Parámetros:
      numero (int): Entero que se busca ver si es primo
    Retorno:
      boolean: Booleano que indica si el número entero recibido por parámetro es primo
    """
    for i in range(2, numero/2 + 1):
        if numero % i == 0:
            return False
    else:
        return True