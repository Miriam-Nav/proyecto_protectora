// Infra
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/data/repositories/animales_repository.dart';

class AnimalController extends AsyncNotifier<List<Animales>> {
  late final AnimalesRepository _repo;

  @override
  Future<List<Animales>> build() async {
    _repo = AnimalesRepository();
    return _repo.fetchAll();
  }

  Future<void> getall() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_repo.fetchAll);
  }

  Future<Animales?> getOne(int idAnimal) async {
    _repo = AnimalesRepository();
    return await _repo.fetchOne(idAnimal);
  }


  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_repo.fetchAll);
  }

  Future<void> add(
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
    if (nombre.trim().isEmpty &&
        sexo.trim().isEmpty &&
        raza.trim().isEmpty &&
        tipo.trim().isEmpty &&
        fNacimiento.trim().isEmpty &&
        estereilizado.trim().isEmpty &&
        chip.trim().isEmpty &&
        descripcion.trim().isEmpty &&
        foto.trim().isEmpty) {
      return;
    }
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

  Future<void> toggle(String id) async {
    try {
      await _repo.updateAnimal(id);
      state = await AsyncValue.guard(_repo.fetchAll);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> remove(String id) async {
    try {
      await _repo.removeAnimal(id);
      state = await AsyncValue.guard(_repo.fetchAll);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final animalesProvider = AsyncNotifierProvider<AnimalController, List<Animales>>(() {
  return AnimalController();
});

final totalAnimalesProvider = Provider<int>((ref) {
  final animales = ref.watch(animalesProvider).value ?? const <Animales>[];
  return animales.length;
});
