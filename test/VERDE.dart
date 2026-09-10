bool insertarYVerificar(List<int> lista, int capacidad, int nuevoNumero) {
  if (lista.length < capacidad) {
    lista.add(nuevoNumero);
  }
  return lista.length >= capacidad;
}

// Función encargada de imprimir los resultados paso a paso
void probarEscenario(String descripcion, List<int> lista, int capacidad, int nuevoNumero) {
  print(descripcion);
  print("  Lista inicial : $lista (Capacidad máxima: $capacidad)");
  print("  Insertando    : $nuevoNumero");
  
  bool estaLlena = insertarYVerificar(lista, capacidad, nuevoNumero);
  
  print("  Lista final   : $lista");
  print("  ¿Está llena?  : $estaLlena");
  print("-" * 50);
}

void main() {
  probarEscenario(
    "Escenario 1: La lista sigue incompleta", 
    [5], 3, 10
  );

  probarEscenario(
    "Escenario 2: La lista se llena exactamente", 
    [5, 10], 3, 15
  );

  probarEscenario(
    "Escenario 3: Intento de insertar en lista ya llena", 
    [5, 10, 15], 3, 20
  );

  probarEscenario(
    "Escenario 4: Lista vacía insertando un número", 
    [], 2, 1
  );
}