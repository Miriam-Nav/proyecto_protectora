import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/data/repositories/animales_repository.dart';

class AnimalesNotifier extends AsyncNotifier<List<Animales>> {
  late final AnimalesRepository _repo;

  @override
  Future<List<Animales>> build() async {
    _repo = AnimalesRepository();
    return _repo.fetchAll();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_repo.fetchAll);
  }

  /// Añadir un nuevo animal con tipos correctos
  Future<void> addAnimal({
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
    final previous = state.value ?? const <Animales>[];
    try {
      final created = await _repo.addAnimal(
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
      state = AsyncValue.data([...previous, created]);
      state = await AsyncValue.guard(_repo.fetchAll);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Actualizar un animal existente
  Future<void> updateAnimal(Animales animal) async {
    try {
      await _repo.updateAnimal(
        idAnimal: animal.idAnimal,
        nombre: animal.nombre,
        sexo: animal.sexo,
        raza: animal.raza,
        tipo: animal.tipo,
        fNacimiento: animal.fNacimiento,
        esterilizado: animal.esterilizado,
        chip: animal.chip,
        descripcion: animal.descripcion,
        foto: animal.foto,
      );
      state = await AsyncValue.guard(_repo.fetchAll);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Eliminar un animal por id
  Future<void> removeAnimal(String id) async {
    try {
      await _repo.removeAnimal(id);
      state = await AsyncValue.guard(_repo.fetchAll);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }


}
