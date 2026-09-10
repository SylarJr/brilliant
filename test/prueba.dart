import 'package:test/test.dart';

// La función a probar
bool insertarYVerificarDistintos(List<int> numeros, int nuevoNumero) {
  numeros.add(nuevoNumero);
  return numeros.length == numeros.toSet().length;
}

void main() {
  group('Pruebas de insertarYVerificarDistintos', () {
    test('Retorna true cuando se inserta un número nuevo (único)', () {
      List<int> lista = [1, 2, 3];
      bool resultado = insertarYVerificarDistintos(lista, 4);

      expect(resultado, isTrue);
      // Opcional: Verificar que la lista realmente se modificó
      expect(lista, equals([1, 2, 3, 4]));
    });

    test('Retorna false cuando se inserta un número que ya existe', () {
      List<int> lista = [10, 20, 30];
      bool resultado = insertarYVerificarDistintos(lista, 20);

      expect(resultado, isFalse);
      expect(lista, equals([10, 20, 30, 20]));
    });

    test('Retorna true al insertar un elemento en una lista vacía', () {
      List<int> lista = [];
      bool resultado = insertarYVerificarDistintos(lista, 5);

      expect(resultado, isTrue);
    });

    test('Retorna false si la lista original ya tenía duplicados', () {
      List<int> lista = [1, 1, 2];
      bool resultado = insertarYVerificarDistintos(lista, 3);

      expect(resultado, isFalse);
    });
  });
}
