import 'package:equatable/equatable.dart';

class Adopcion extends Equatable {
  // Datos del animal
  final String idAnimal;
  final String nombreAnimal;
  final String? chip;

  // Datos del usuario/adoptante
  final String usuarioNombre;
  final String usuarioEmail;
  final String usuarioTelefono;
  final DateTime fechaAdopcion;

  // Constructor
  const Adopcion({
    required this.idAnimal,
    required this.nombreAnimal,
    this.chip,
    required this.usuarioNombre,
    required this.usuarioEmail,
    required this.usuarioTelefono,
    required this.fechaAdopcion,
  });

  // Crear una instancia a partir de un JSON
  factory Adopcion.fromJson(Map<String, dynamic> json) => Adopcion(
    idAnimal: json['idAnimal'] as String,
    nombreAnimal: json['nombreAnimal'] as String,
    chip: json['chip'] as String, // se espera un String, puede ser null
    usuarioNombre: json['usuarioNombre'] as String,
    usuarioEmail: json['usuarioEmail'] as String,
    usuarioTelefono: json['usuarioTelefono'] as String,
    fechaAdopcion: DateTime.parse(json['fechaAdopcion'] as String),
  );

  // Converte la instancia en un JSON
  Map<String, dynamic> toJson() => {
    'idAnimal': idAnimal,
    'nombreAnimal': nombreAnimal,
    'chip': chip,
    'usuarioNombre': usuarioNombre,
    'usuarioEmail': usuarioEmail,
    'usuarioTelefono': usuarioTelefono,
    'fechaAdopcion': fechaAdopcion.toIso8601String(),
  };

  // Define los campos que se usan para comparar instancias
  @override
  List<Object?> get props => [
    idAnimal,
    nombreAnimal,
    chip,
    usuarioNombre,
    usuarioEmail,
    usuarioTelefono,
    fechaAdopcion,
  ];
}
