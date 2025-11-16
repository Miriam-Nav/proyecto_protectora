import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:uuid/uuid.dart';

class AnimalesRepository {
  final _uuid = const Uuid();
  var _animalesList = <Animales>[
    Animales(
      idAnimal: '1',
      nombre: 'Nala',
      sexo: 'Hembra',
      raza: 'Golden Retriever',
      tipo: 'Perro',
      fNacimiento: '2019-08-22',
      estereilizado: 'Sí',
      chip: 'CHIP001',
      descripcion: 'Dulce y sociable',
      foto: 'https://cataas.com/cat?random=1',
    ),
    Animales(
      idAnimal: '2',
      nombre: 'Leo',
      sexo: 'Macho',
      raza: 'Labrador',
      tipo: 'Perro',
      fNacimiento: '2020-01-15',
      estereilizado: 'No',
      chip: 'CHIP002',
      descripcion: 'Activo y juguetón',
      foto: 'https://cataas.com/cat?random=2',
    ),
    Animales(
      idAnimal: '3',
      nombre: 'Kiara',
      sexo: 'Hembra',
      raza: 'Siames',
      tipo: 'Gato',
      fNacimiento: '2021-03-10',
      estereilizado: 'Sí',
      chip: 'CHIP003',
      descripcion: 'Curiosa y trepadora',
      foto: 'https://cataas.com/cat?random=3',
    ),
    Animales(
      idAnimal: '4',
      nombre: 'Toby',
      sexo: 'Macho',
      raza: 'Beagle',
      tipo: 'Perro',
      fNacimiento: '2018-07-05',
      estereilizado: 'No',
      chip: 'CHIP004',
      descripcion: 'Cariñoso y familiar',
      foto: 'https://cataas.com/cat?random=4',
    ),
    Animales(
      idAnimal: '5',
      nombre: 'Luna',
      sexo: 'Hembra',
      raza: 'Persa',
      tipo: 'Gato',
      fNacimiento: '2020-11-30',
      estereilizado: 'Sí',
      chip: 'CHIP005',
      descripcion: 'Tranquila y dormilona',
      foto: 'https://cataas.com/cat?random=5',
    ),
    Animales(
      idAnimal: '6',
      nombre: 'Rocky',
      sexo: 'Macho',
      raza: 'Pastor Alemán',
      tipo: 'Perro',
      fNacimiento: '2017-04-18',
      estereilizado: 'Sí',
      chip: 'CHIP006',
      descripcion: 'Protector y obediente',
      foto: 'https://cataas.com/cat?random=6',
    ),
    Animales(
      idAnimal: '7',
      nombre: 'Maya',
      sexo: 'Hembra',
      raza: 'Atigrado',
      tipo: 'Gato',
      fNacimiento: '2022-01-08',
      estereilizado: 'No',
      chip: 'CHIP007',
      descripcion: 'Juguetona y curiosa',
      foto: 'https://cataas.com/cat?random=7',
    ),
    Animales(
      idAnimal: '8',
      nombre: 'Simba',
      sexo: 'Macho',
      raza: 'Maine Coon',
      tipo: 'Gato',
      fNacimiento: '2019-09-25',
      estereilizado: 'Sí',
      chip: 'CHIP008',
      descripcion: 'Grande y tranquilo',
      foto: 'https://cataas.com/cat?random=8',
    ),
    Animales(
      idAnimal: '9',
      nombre: 'Coco',
      sexo: 'Macho',
      raza: 'Border Collie',
      tipo: 'Perro',
      fNacimiento: '2020-06-12',
      estereilizado: 'No',
      chip: 'CHIP009',
      descripcion: 'Inteligente y activo',
      foto: 'https://cataas.com/cat?random=9',
    ),
    Animales(
      idAnimal: '10',
      nombre: 'Mimi',
      sexo: 'Hembra',
      raza: 'Europeo',
      tipo: 'Gato',
      fNacimiento: '2021-12-03',
      estereilizado: 'Sí',
      chip: 'CHIP010',
      descripcion: 'Cariñosa y tranquila',
      foto: 'https://cataas.com/cat?random=10',
    ),
  ];

  Future<List<Animales>> fetchAll() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _animalesList;
  }

  Future<List<Animales>> fetchOne(String idAnimal) async {
    final oneAnimal = _animalesList.map((animal) {
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
    return oneAnimal;
  }

  Future<void> updateAnimal(
    String idAnimal,
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
    _animalesList = _animalesList.map((animal) {
      if (animal.idAnimal.toString() == idAnimal) {
        return Animales(
          idAnimal: animal.idAnimal,
          nombre: nombre,
          sexo: sexo,
          raza: raza,
          tipo: tipo,
          fNacimiento: fNacimiento,
          estereilizado: estereilizado,
          chip: chip,
          descripcion: descripcion,
          foto: foto,
        );
      }
      return animal;
    }).toList();
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
    _animalesList.removeWhere((a) => a.idAnimal == idAnimal);
  }
}
