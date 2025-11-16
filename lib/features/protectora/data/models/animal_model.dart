import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  final int idAnimal;
  final String nombre;
  final String sexo;
  final String raza;
  final String tipo;
  final String fNacimiento;
  final String estereilizado;
  final String chip;
  final String descripcion;
  final String foto;

  const Animal({
    required this.idAnimal,
    required this.nombre,
    required this.sexo,
    required this.raza,
    required this.tipo,
    required this.fNacimiento,
    required this.estereilizado,
    required this.chip,
    required this.descripcion,
    required this.foto,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    idAnimal: json['idAnimal'] as int,
    nombre: json['nombre'] as String,
    sexo: json['sexo'] as String,
    raza: json['raza'] as String,
    tipo: json['tipo'] as String,
    fNacimiento: json['fNacimiento'] as String,
    estereilizado: json['estereilizado'] as String,
    chip: json['chip'] as String,
    descripcion: json['descripcion'] as String,
    foto: json['foto'] as String,
  );

  @override
  List<Object?> get props => [idAnimal];
}
