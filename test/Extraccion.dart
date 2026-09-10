import 'dart:math';

// Colores basados en la imagen
enum ColorBloque { amarillo, morado, azul, verde, naranja }

// Direcciones posibles en el tablero
enum Direccion { centro, arriba, abajo, izquierda, derecha, arribaIzquierda, arribaDerecha, abajoIzquierda, abajoDerecha }

class Celda {
  final int x;
  final int y;
  final ColorBloque color;
  final int valor; // Número aleatorio

  Celda(this.x, this.y, this.color, this.valor);
}

class Bloque {
  final ColorBloque color;
  final List<Celda> celdas;
  final int anchoTablero;
  final int altoTablero;

  Bloque(this.color, this.celdas, this.anchoTablero, this.altoTablero);

  // Función principal solicitada: Extraer los números aleatorios del bloque
  List<int> extraerDatos() {
    return celdas.map((celda) => celda.valor).toList();
  }

  // Determinar la dirección general del bloque basándose en la posición de sus celdas
  Direccion get direccion {
    if (celdas.isEmpty) return Direccion.centro;

    // Calculamos el punto medio del bloque
    double promX = celdas.map((c) => c.x).reduce((a, b) => a + b) / celdas.length;
    double promY = celdas.map((c) => c.y).reduce((a, b) => a + b) / celdas.length;

    // Dividimos el tablero en 3 secciones (tercios) para saber dónde está
    bool esIzquierda = promX < anchoTablero / 3;
    bool esDerecha = promX > (anchoTablero * 2) / 3;
    bool esArriba = promY < altoTablero / 3;
    bool esAbajo = promY > (altoTablero * 2) / 3;

    if (esIzquierda && esArriba) return Direccion.arribaIzquierda;
    if (esDerecha && esArriba) return Direccion.arribaDerecha;
    if (esIzquierda && esAbajo) return Direccion.abajoIzquierda;
    if (esDerecha && esAbajo) return Direccion.abajoDerecha;
    
    if (esIzquierda) return Direccion.izquierda;
    if (esDerecha) return Direccion.derecha;
    if (esArriba) return Direccion.arriba;
    if (esAbajo) return Direccion.abajo;

    return Direccion.centro;
  }
}

void main() {
  final random = Random();
  
  // Simulamos un bloque morado en la parte inferior izquierda del tablero (8x8)
  List<Celda> celdasMoradas = [
    Celda(1, 6, ColorBloque.morado, random.nextInt(100)),
    Celda(2, 6, ColorBloque.morado, random.nextInt(100)),
    Celda(1, 7, ColorBloque.morado, random.nextInt(100)),
  ];

  // Creamos el bloque
  Bloque bloqueMorado = Bloque(ColorBloque.morado, celdasMoradas, 8, 8);

  // Extraemos la información
  print('Color: ${bloqueMorado.color.name}');
  print('Dirección: ${bloqueMorado.direccion.name}');
  print('Datos extraídos (Números): ${bloqueMorado.extraerDatos()}');
}