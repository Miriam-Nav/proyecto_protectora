import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:uuid/uuid.dart';

class AnimalesRepository {
  final _uuid = const Uuid();
  var _animalesList = <Animales>[
    const Animales(
      idAnimal: 1,
      nombre: 'Nala',
      sexo: 'Hembra',
      raza: 'Golden Retriever',
      tipo: 'Perro',
      fNacimiento: '2019-08-22',
      estereilizado: 'Sí',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Dulce y sociable',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 2,
      nombre: 'Leo',
      sexo: 'Macho',
      raza: 'Labrador',
      tipo: 'Perro',
      fNacimiento: '2020-01-15',
      estereilizado: 'No',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Activo y juguetón',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 3,
      nombre: 'Kiara',
      sexo: 'Hembra',
      raza: 'Siames',
      tipo: 'Gato',
      fNacimiento: '2021-03-10',
      estereilizado: 'Sí',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Curiosa y trepadora',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 4,
      nombre: 'Toby',
      sexo: 'Macho',
      raza: 'Beagle',
      tipo: 'Perro',
      fNacimiento: '2018-07-05',
      estereilizado: 'No',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Cariñoso y familiar',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 5,
      nombre: 'Luna',
      sexo: 'Hembra',
      raza: 'Persa',
      tipo: 'Gato',
      fNacimiento: '2020-11-30',
      estereilizado: 'Sí',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Tranquila y dormilona',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 6,
      nombre: 'Rocky',
      sexo: 'Macho',
      raza: 'Pastor Alemán',
      tipo: 'Perro',
      fNacimiento: '2017-04-18',
      estereilizado: 'Sí',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Protector y obediente',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 7,
      nombre: 'Maya',
      sexo: 'Hembra',
      raza: 'Atigrado',
      tipo: 'Gato',
      fNacimiento: '2022-01-08',
      estereilizado: 'No',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Juguetona y curiosa',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 8,
      nombre: 'Simba',
      sexo: 'Macho',
      raza: 'Maine Coon',
      tipo: 'Gato',
      fNacimiento: '2019-09-25',
      estereilizado: 'Sí',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Grande y tranquilo',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 9,
      nombre: 'Coco',
      sexo: 'Macho',
      raza: 'Border Collie',
      tipo: 'Perro',
      fNacimiento: '2020-06-12',
      estereilizado: 'No',
      chip: '1234aa',
      descripcion: 'Inteligente y activo',
      foto: 'assets/images/gatito.jpg',
    ),
    const Animales(
      idAnimal: 10,
      nombre: 'Mimi',
      sexo: 'Hembra',
      raza: 'Europeo',
      tipo: 'Gato',
      fNacimiento: '2021-12-03',
      estereilizado: 'Sí',
      chip: 'assets/images/gatito.jpg',
      descripcion: 'Cariñosa y tranquila',
      foto: 'assets/images/gatito.jpg',
    ),
  ];

  Future<List<Animales>> fetchAll() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _animalesList;
  }

  Future<Animales> fetchOne(int idAnimal) async {
  final animal = _animalesList.firstWhere(
    (a) => a.idAnimal == idAnimal,
  );
  return animal;
}


  Future<void> updateAnimal(String idAnimal) async {
    final updatedModels = _animalesList.map((animal) {
      if (animal.idAnimal == idAnimal) {
        return Animales(
          idAnimal: animal.idAnimal,
          nombre: animal.nombre,
          sexo: animal.sexo,
          raza: animal.raza,
          tipo: animal.tipo,
          fNacimiento: animal.fNacimiento,
          estereilizado: animal.estereilizado,
          chip: animal.chip,
          descripcion: animal.descripcion,
          foto: animal.foto,
        );
      }
      return animal;
    }).toList();
    _animalesList = updatedModels;
  }

  Future<Animales> addAnimal(
    String nombre,
    String sexo,
    String raza,
    String tipo,
    String fNacimiento,
    String estereilizado,
    String chip,
    String descripcion,
    String foto,
  ) async {
    final models = await fetchAll();
    final model = Animales(
      idAnimal: _uuid.v4(),
      nombre: nombre.trim(),
      sexo: sexo.trim(),
      raza: raza.trim(),
      tipo: tipo.trim(),
      fNacimiento: fNacimiento.trim(),
      estereilizado: estereilizado.trim(),
      chip: chip.trim(),
      descripcion: descripcion.trim(),
      foto: foto.trim(),
    );
    _animalesList = [...models, model];
    return model;
  }

  Future<void> removeAnimal(String idAnimal) async {
    _animalesList.removeWhere((t) => t.idAnimal == idAnimal);
  }
}
