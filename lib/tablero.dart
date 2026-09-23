/// Colores asignados a las regiones del tablero
enum RegionColor {
  rojo,
  morado,
  verde,
  azul,
  amarillo,
}

/// Representa una celda individual dentro del tablero 7x7
class BoardCell {
  final int row;
  final int col;
  final RegionColor region;
  final bool isMarked;
  int? value;

  BoardCell({
    required this.row,
    required this.col,
    required this.region,
    this.isMarked = false,
    this.value,
  });

  bool get isFilled => value != null;

  void clear() => value = null;
}

/// Tablero de 7x7 con restricción de edición por casillas marcadas
class BrilliantBoard {
  static const int boardSize = 7;
  late final List<List<BoardCell>> _grid;

  BrilliantBoard({
    required List<List<RegionColor>> regionLayout,
    Set<(int row, int col)> markedPositions = const {},
  }) {
    if (regionLayout.length != boardSize ||
        regionLayout.any((row) => row.length != boardSize)) {
      throw ArgumentError(
        'El diseño de regiones debe ser una matriz estricta de ${boardSize}x$boardSize.',
      );
    }

    _grid = List.generate(
      boardSize,
      (r) => List.generate(
        boardSize,
        (c) {
          final isMarked = markedPositions.contains((r, c));
          return BoardCell(
            row: r,
            col: c,
            region: regionLayout[r][c],
            isMarked: isMarked,
          );
        },
        growable: false,
      ),
      growable: false,
    );
  }

  BoardCell getCell(int row, int col) {
    _validateCoordinates(row, col);
    return _grid[row][col];
  }

  bool isCellEditable(int row, int col) {
    _validateCoordinates(row, col);
    return _grid[row][col].isMarked;
  }

  void setCellValue(int row, int col, int? value) {
    _validateCoordinates(row, col);
    final cell = _grid[row][col];

    if (!cell.isMarked) {
      throw StateError(
        'Acción no permitida: La casilla ($row, $col) no está marcada para ingresar números.',
      );
    }

    cell.value = value;
  }

  List<BoardCell> get markedCells =>
      _grid.expand((row) => row).where((cell) => cell.isMarked).toList();

  bool get isCompleted {
    final marked = markedCells;
    if (marked.isEmpty) return false;
    return marked.every((cell) => cell.isFilled);
  }

  double get completionProgress {
    final marked = markedCells;
    if (marked.isEmpty) return 0.0;
    final filled = marked.where((c) => c.isFilled).length;
    return filled / marked.length;
  }

  void _validateCoordinates(int row, int col) {
    if (row < 0 || row >= boardSize || col < 0 || col >= boardSize) {
      throw RangeError('Coordenadas fuera de rango: ($row, $col).');
    }
  }
}