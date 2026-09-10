void main() {
  // 1. La lista inicia incompleta (capacidad máxima de 3)
  List<int> miLista = [10, 20];
  int capacidadMaxima = 3;

  print("Estado inicial: $miLista");

  // 2. Insertamos un nuevo número y verificamos si se llenó
  bool estaLlena = insertarYVerificar(miLista, capacidadMaxima, 30);
  
  print("Estado final: $miLista");
  print("¿La lista está llena? $estaLlena");
  
}



/// Función que inserta un número y retorna true si la lista se llenó
bool insertarYVerificar(List<int> lista, int capacidad, int nuevoNumero) {
  // Evitamos agregar si ya estaba llena desde antes
  if (lista.length < capacidad) {
    lista.add(nuevoNumero);
  }
  
  // Retorna verdadero si la longitud de la lista alcanzó la capacidad
  return lista.length >= capacidad;
  
}

