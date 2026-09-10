int calculate() {
  return 6 * 7;
}

bool contieneDosNumerosRepetidos(List<int> numeros) {
  final conteo = <int, int>{};

  for (final numero in numeros) {
    conteo[numero] = (conteo[numero] ?? 0) + 1;
  }

  return conteo.length == 2 && conteo.values.every((cantidad) => cantidad >= 2);
}
