import 'package:proyecto_protectora/features/protectora/data/models/animales_model.dart';
import 'package:uuid/uuid.dart';

class AnimalesRepository {
  final _uuid = const Uuid();
  var _animalesList = <Animales>[
    Animales(
      idAnimal: "A001",
      nombre: "Luna",
      sexo: Sexo.hembra,
      raza: "Labrador",
      tipo: TipoAnimal.perro,
      fNacimiento: DateTime(2020, 5, 12),
      esterilizado: true,
      chip: "123456789",
      descripcion: "Muy cariñosa y juguetona.",
      foto: "https://place.dog/300/200?random=1",
    ),
    Animales(
      idAnimal: "A002",
      nombre: "Max",
      sexo: Sexo.macho,
      raza: "Pastor Alemán",
      tipo: TipoAnimal.perro,
      fNacimiento: DateTime(2019, 3, 8),
      esterilizado: false,
      chip: "987654321",
      descripcion: "Protector y obediente.",
      foto: "https://place.dog/300/200?random=2",
    ),
    Animales(
      idAnimal: "A003",
      nombre: "Mia",
      sexo: Sexo.hembra,
      raza: "Siames",
      tipo: TipoAnimal.gato,
      fNacimiento: DateTime(2021, 7, 20),
      esterilizado: true,
      chip: "112233445",
      descripcion: "Tranquila y observadora.",
      foto: "https://cataas.com/cat?random=3",
    ),
    Animales(
      idAnimal: "A004",
      nombre: "Rocky",
      sexo: Sexo.macho,
      raza: "Bulldog",
      tipo: TipoAnimal.perro,
      fNacimiento: DateTime(2018, 11, 2),
      esterilizado: true,
      chip: "556677889",
      descripcion: "Simpático y glotón.",
      foto: "https://place.dog/300/200?random=4",
    ),
    Animales(
      idAnimal: "A005",
      nombre: "Nala",
      sexo: Sexo.hembra,
      raza: "Mestizo",
      tipo: TipoAnimal.gato,
      fNacimiento: DateTime(2022, 1, 15),
      esterilizado: false,
      chip: "998877665",
      descripcion: "Curiosa y juguetona.",
      foto: "https://cataas.com/cat?random=5",
    ),
    Animales(
      idAnimal: "A006",
      nombre: "Thor",
      sexo: Sexo.macho,
      raza: "Husky Siberiano",
      tipo: TipoAnimal.perro,
      fNacimiento: DateTime(2020, 9, 30),
      esterilizado: false,
      chip: "445566778",
      descripcion: "Activo y muy sociable.",
      foto: "https://place.dog/300/200?random=6",
    ),
    Animales(
      idAnimal: "A007",
      nombre: "Bella",
      sexo: Sexo.hembra,
      raza: "Golden Retriever",
      tipo: TipoAnimal.perro,
      fNacimiento: DateTime(2017, 6, 25),
      esterilizado: true,
      chip: "223344556",
      descripcion: "Cariñosa y paciente.",
      foto: "https://place.dog/300/200?random=7",
    ),
    Animales(
      idAnimal: "A008",
      nombre: "Simba",
      sexo: Sexo.macho,
      raza: "Maine Coon",
      tipo: TipoAnimal.gato,
      fNacimiento: DateTime(2019, 12, 10),
      esterilizado: true,
      chip: "667788990",
      descripcion: "Grande y tranquilo.",
      foto: "https://cataas.com/cat?random=8",
    ),
    Animales(
      idAnimal: "A009",
      nombre: "Coco",
      sexo: Sexo.macho,
      raza: "Beagle",
      tipo: TipoAnimal.perro,
      fNacimiento: DateTime(2021, 4, 5),
      esterilizado: false,
      chip: "334455667",
      descripcion: "Curioso y energético.",
      foto: "https://place.dog/300/200?random=9",
    ),
    Animales(
      idAnimal: "A010",
      nombre: "Lola",
      sexo: Sexo.hembra,
      raza: "Persa",
      tipo: TipoAnimal.gato,
      fNacimiento: DateTime(2018, 8, 18),
      esterilizado: true,
      chip: "778899001",
      descripcion: "Elegante y calmada.",
      foto: "https://cataas.com/cat?random=10",
    ),
  ];

  /// Devuelve un solo animal por id
  Future<List<Animales>> fetchAll() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _animalesList;
  }

  /// Actualiza un animal existente
  Future<void> updateAnimal({
    required String idAnimal,
    required String nombre,
    required Sexo sexo,
    required String raza,
    required TipoAnimal tipo,
    required DateTime fNacimiento,
    required bool esterilizado,
    String? chip,
    required String descripcion,
    required String foto,
  }) async {
    _animalesList = _animalesList.map((animal) {
      if (animal.idAnimal == idAnimal) {
        return Animales(
          idAnimal: idAnimal,
          nombre: nombre,
          sexo: sexo,
          raza: raza,
          tipo: tipo,
          fNacimiento: fNacimiento,
          esterilizado: esterilizado,
          chip: chip,
          descripcion: descripcion,
          foto: foto,
        );
      }
      return animal;
    }).toList();
  }

  /// Añade un nuevo animal
  Future<Animales> addAnimal({
    required String nombre,
    required Sexo sexo,
    required String raza,
    required TipoAnimal tipo,
    required DateTime fNacimiento,
    required bool esterilizado,
    String? chip,
    required String descripcion,
    required String foto,
  }) async {
    final model = Animales(
      idAnimal: _uuid.v4(),
      nombre: nombre,
      sexo: sexo,
      raza: raza,
      tipo: tipo,
      fNacimiento: fNacimiento,
      esterilizado: esterilizado,
      chip: chip,
      descripcion: descripcion.trim(),
      foto: foto.trim(),
    );
    _animalesList.add(model);
    return model;
  }

  /// Elimina un animal por id
  Future<void> removeAnimal(String idAnimal) async {
    _animalesList.removeWhere((a) => a.idAnimal == idAnimal);
  }
}
