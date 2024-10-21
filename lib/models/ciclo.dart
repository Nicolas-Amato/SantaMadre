class Ciclo {
  String nombre;
  DateTime fechaInicio;
  // añadir más propiedades, como la lista de días, si fuera necesario

  Ciclo({
    required this.nombre,
    required this.fechaInicio,
  });

  // Métodos de serialización si decides guardar el objeto en almacenamiento local
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'fechaInicio': fechaInicio.toIso8601String(),
    };
  }

  factory Ciclo.fromJson(Map<String, dynamic> json) {
    return Ciclo(
      nombre: json['nombre'],
      fechaInicio: DateTime.parse(json['fechaInicio']),
    );
  }
}