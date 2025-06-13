class Exercise {
  final String nombre;
  final String? descripcion;
  final int? duracionMinutos;

  Exercise({required this.nombre, this.descripcion, this.duracionMinutos});

  @override
  String toString() => nombre;
}
