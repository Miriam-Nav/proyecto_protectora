import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';
import 'package:proyecto_protectora/features/protectora/data/repositories/adopciones_repository.dart';

class AdopcionesNotifier extends AsyncNotifier<List<Adopcion>> {
  final _repo = AdopcionesRepository();

  @override
  Future<List<Adopcion>> build() async {
    return _repo.fetchAll();
  }

  Future<void> addAdopcion(Adopcion adopcion) async {
    await _repo.addAdopcion(
      idAnimal: adopcion.idAnimal,
      nombreAnimal: adopcion.nombreAnimal,
      chip: adopcion.chip,
      usuarioNombre: adopcion.usuarioNombre,
      usuarioEmail: adopcion.usuarioEmail,
      usuarioTelefono: adopcion.usuarioTelefono,
    );
    state = AsyncData(await _repo.fetchAll());
  }

  Future<void> removeAdopcion(int idAnimal) async {
    await _repo.removeAdopcion(idAnimal);
    state = AsyncData(await _repo.fetchAll());
  }

  Future<void> updateAdopcion(Adopcion adopcion) async {
    await _repo.updateAdopcion(
      adopcion.idAnimal,
      usuarioNombre: adopcion.usuarioNombre,
      usuarioEmail: adopcion.usuarioEmail,
      usuarioTelefono: adopcion.usuarioTelefono,
    );
    state = AsyncData(await _repo.fetchAll());
  }
}
