import 'package:equatable/equatable.dart';

class Animales extends Equatable {
  final String idAnimal;
  final String nombre;
  final Sexo sexo;
  final String raza;
  final TipoAnimal tipo;
  final DateTime fNacimiento;
  final bool esterilizado;
  final String? chip;
  final String descripcion;
  final String foto;

  const Animales({
    required this.idAnimal,
    required this.nombre,
    required this.sexo,
    required this.raza,
    required this.tipo,
    required this.fNacimiento,
    required this.esterilizado,
    this.chip,
    required this.descripcion,
    required this.foto,
  });

  // Permite crear una copia del objeto modificando solo algunos campos
  Animales copyWith({
    String? idAnimal,
    String? nombre,
    Sexo? sexo,
    String? raza,
    TipoAnimal? tipo,
    DateTime? fNacimiento,
    bool? esterilizado,
    String? chip,
    String? descripcion,
    String? foto,
  }) {
    return Animales(
      idAnimal: idAnimal ?? this.idAnimal,
      nombre: nombre ?? this.nombre,
      sexo: sexo ?? this.sexo,
      raza: raza ?? this.raza,
      tipo: tipo ?? this.tipo,
      fNacimiento: fNacimiento ?? this.fNacimiento,
      esterilizado: esterilizado ?? this.esterilizado,
      chip: chip ?? this.chip,
      descripcion: descripcion ?? this.descripcion,
      foto: foto ?? this.foto,
    );
  }

  // Define los campos que se usan para comparar instancias
  @override
  List<Object?> get props => [
    idAnimal,
    nombre,
    sexo,
    raza,
    tipo,
    fNacimiento,
    esterilizado,
    chip,
    descripcion,
    foto,
  ];
}

// --- Enums para definir los valores ---
enum Sexo { macho, hembra }

enum TipoAnimal { perro, gato, otro }
