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

  Future<void> addAnimal(
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
    final previous = state.value ?? const <Animales>[];
    try {
      final created = await _repo.addAnimal(
        nombre,
        sexo,
        raza,
        tipo,
        fNacimiento,
        estereilizado,
        chip,
        descripcion,
        foto,
      );
      state = AsyncValue.data([...previous, created]);
      state = await AsyncValue.guard(_repo.fetchAll);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateAnimal(Animales animal) async {
    try {
      await _repo.updateAnimal(
        animal.idAnimal,
        animal.nombre,
        animal.sexo,
        animal.raza,
        animal.tipo,
        animal.fNacimiento,
        animal.estereilizado,
        animal.chip,
        animal.descripcion,
        animal.foto,
      );
      state = await AsyncValue.guard(_repo.fetchAll);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> removeAnimal(String id) async {
    try {
      await _repo.removeAnimal(id);
      state = await AsyncValue.guard(_repo.fetchAll);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
