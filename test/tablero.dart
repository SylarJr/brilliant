import 'package:test/test.dart';


import '../lib/tablero.dart';



void main() {
  group('BrilliantBoard - Pruebas de casillas marcadas', () {
    late List<List<RegionColor>> sampleLayout;
    late Set<(int, int)> markedCoordinates;

    setUp(() {
      sampleLayout = List.generate(
        7,
        (_) => List.generate(7, (_) => RegionColor.verde),
      );

      // Coordenadas con "X" de la imagen
      markedCoordinates = {
        (0, 2),
        (1, 4),
        (3, 1),
        (3, 3),
        (5, 2),
        (6, 4),
      };
    });

    test('Permite ingresar números en casillas marcadas', () {
      final board = BrilliantBoard(
        regionLayout: sampleLayout,
        markedPositions: markedCoordinates,
      );

      expect(() => board.setCellValue(0, 2, 8), returnsNormally);
      expect(board.getCell(0, 2).value, equals(8));
      expect(board.getCell(0, 2).isFilled, isTrue);
    });

    test('Lanza StateError si se intenta escribir en una casilla no marcada', () {
      final board = BrilliantBoard(
        regionLayout: sampleLayout,
        markedPositions: markedCoordinates,
      );

      expect(board.isCellEditable(0, 0), isFalse);
      expect(
        () => board.setCellValue(0, 0, 5),
        throwsA(isA<StateError>()),
      );
      expect(board.getCell(0, 0).value, isNull);
    });

    test('Calcula el progreso y valida que no esté completado al inicio', () {
      final board = BrilliantBoard(
        regionLayout: sampleLayout,
        markedPositions: markedCoordinates,
      );

      expect(board.isCompleted, isFalse);
      expect(board.completionProgress, equals(0.0));

      // Asignar 3 de las 6 casillas marcadas (50%)
      board.setCellValue(0, 2, 4);
      board.setCellValue(1, 4, 7);
      board.setCellValue(3, 1, 1);

      expect(board.completionProgress, equals(0.5));
      expect(board.isCompleted, isFalse);
    });

    test('El tablero pasa a isCompleted = true al rellenar todas las casillas marcadas', () {
      final board = BrilliantBoard(
        regionLayout: sampleLayout,
        markedPositions: markedCoordinates,
      );

      for (final (r, c) in markedCoordinates) {
        board.setCellValue(r, c, 9);
      }

      expect(board.completionProgress, equals(1.0));
      expect(board.isCompleted, isTrue);
    });
  });
}