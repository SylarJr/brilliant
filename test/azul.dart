// ==========================================
// LÓGICA PRINCIPAL
// ==========================================

/// Función 1: Inserta un número y retorna true si la lista se llenó
bool insertarYVerificar(List<int> lista, int capacidad, int nuevoNumero) {
  if (lista.length < capacidad) {
    lista.add(nuevoNumero);
  }
  return lista.length >= capacidad;
}

/// Función 2: Retorna true si todos los elementos de la lista son iguales
bool todosIguales(List<int> lista) {
  if (lista.isEmpty) return true; // Una lista vacía se considera válida
  int primerElemento = lista.first;
  
  // .every() evalúa si todos los elementos cumplen la condición
  return lista.every((elemento) => elemento == primerElemento);
}


// ==========================================
// FUNCIONES DE IMPRESIÓN Y PRUEBA
// ==========================================

void probarEscenarioInsercion(String descripcion, List<int> lista, int capacidad, int nuevoNumero) {
  print(descripcion);
  print("  Lista inicial : $lista (Capacidad máxima: $capacidad)");
  print("  Insertando    : $nuevoNumero");
  
  bool estaLlena = insertarYVerificar(lista, capacidad, nuevoNumero);
  
  print("  Lista final   : $lista");
  print("  ¿Está llena?  : $estaLlena");
  print("-" * 50);
}

void probarEscenarioIgualdad(String descripcion, List<int> lista) {
  print(descripcion);
  print("  Lista actual          : $lista");
  
  bool iguales = todosIguales(lista);
  
  print("  ¿Todos son iguales?   : $iguales");
  print("-" * 50);
}


// ==========================================
// EJECUCIÓN (MAIN)
// ==========================================

void main() {
  print("=== PRUEBAS DE INSERCIÓN Y CAPACIDAD ===\n");
  
  probarEscenarioInsercion("Escenario 1: La lista sigue incompleta", [5], 3, 10);
  probarEscenarioInsercion("Escenario 2: La lista se llena exactamente", [5, 10], 3, 15);
  probarEscenarioInsercion("Escenario 3: Intento de insertar en lista ya llena", [5, 10, 15], 3, 20);

  print("\n=== PRUEBAS DE IGUALDAD DE NÚMEROS ===\n");
  
  probarEscenarioIgualdad("Escenario 4: Todos los números son iguales", [8, 8, 8, 8]);
  probarEscenarioIgualdad("Escenario 5: Un número es distinto", [7, 7, 9, 7]);
  probarEscenarioIgualdad("Escenario 6: Lista con un solo número (siempre es igual a sí mismo)", [42]);
  probarEscenarioIgualdad("Escenario 7: Lista vacía", []);
}