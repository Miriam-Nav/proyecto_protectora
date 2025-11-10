
import 'package:equatable/equatable.dart';

class Animales extends Equatable {
  final dynamic idAnimal;
  final dynamic nombre;
  final dynamic sexo;
  final dynamic raza;
  final dynamic tipo;
  final dynamic fNacimiento;
  final dynamic estereilizado;
  final dynamic chip;
  final dynamic descripcion;
  final dynamic foto;

  const Animales({required this.idAnimal, required this.nombre,required this.sexo, required this.raza, required this.tipo, required this.fNacimiento, required this.estereilizado, required this.chip, required this.descripcion, required this.foto});

  Animales copyWith({String? id, String? title, bool? completed}) => Animales(
    idAnimal: id ?? this.idAnimal,
    nombre: nombre ?? this.nombre,
    sexo: sexo ?? this.sexo, 
    raza: raza ??  this.raza,
    tipo: tipo ?? this.tipo,
    fNacimiento: fNacimiento ?? this.fNacimiento,
    estereilizado: estereilizado ?? this.estereilizado,
    chip: chip ?? this.chip,
    descripcion: descripcion ?? this.descripcion,
    foto: foto ?? this.foto,
  );

  @override
  List<Object?> get props => [idAnimal, nombre, sexo, raza, tipo, fNacimiento, estereilizado, chip, descripcion, foto];
}
