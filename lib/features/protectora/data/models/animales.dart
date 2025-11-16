import 'package:equatable/equatable.dart';

class Animales extends Equatable {
  final String idAnimal;
  final String nombre;
  final String sexo;
  final String raza;
  final String tipo;
  final String fNacimiento;
  final String estereilizado;
  final String chip;
  final String descripcion;
  final String foto;

  const Animales({
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

  Animales copyWith({
    String? idAnimal,
    String? nombre,
    String? sexo,
    String? raza,
    String? tipo,
    String? fNacimiento,
    String? estereilizado,
    String? chip,
    String? descripcion,
    String? foto,
  }) => Animales(
    idAnimal: idAnimal ?? this.idAnimal,
    nombre: nombre ?? this.nombre,
    sexo: sexo ?? this.sexo,
    raza: raza ?? this.raza,
    tipo: tipo ?? this.tipo,
    fNacimiento: fNacimiento ?? this.fNacimiento,
    estereilizado: estereilizado ?? this.estereilizado,
    chip: chip ?? this.chip,
    descripcion: descripcion ?? this.descripcion,
    foto: foto ?? this.foto,
  );

  @override
  List<Object?> get props => [
    idAnimal,
    nombre,
    sexo,
    raza,
    tipo,
    fNacimiento,
    estereilizado,
    chip,
    descripcion,
    foto,
  ];
}
