import 'package:brilliant/brilliant.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('acepta solo dos numeros repetidos', () {
    final primeraLista = [1, 1, 2, 2];
    final segundaLista = [1, 1, 2, 2, 1, 2];

    print('Lista: $primeraLista -> ${contieneDosNumerosRepetidos(primeraLista)}');
    print('Lista: $segundaLista -> ${contieneDosNumerosRepetidos(segundaLista)}');

    expect(contieneDosNumerosRepetidos(primeraLista), isTrue);
    expect(contieneDosNumerosRepetidos(segundaLista), isTrue);
  });

  test('rechaza numeros distintos o repeticiones insuficientes', () {
    final listasInvalidas = [
      [1, 1, 2, 3],
      [1, 1, 2],
      [1, 1, 2,2,2,1],
      <int>[],
    ];

    for (final lista in listasInvalidas) {
      print('Lista: $lista -> ${contieneDosNumerosRepetidos(lista)}');
      expect(contieneDosNumerosRepetidos(lista), isFalse);
    }
  });
}
