import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';
import 'package:proyecto_protectora/features/protectora/data/repositories/adopciones_repository.dart';

class AdopcionesNotifier extends AsyncNotifier<List<Adopcion>> {
  final _repo = AdopcionesRepository();

  @override
  Future<List<Adopcion>> build() async {
    // Al inicializar se cargan todas las adopciones desde el repositorio
    return _repo.fetchAll();
  }

  // Método para añadir una nueva adopción
  Future<void> addAdopcion(Adopcion adopcion) async {
    // Se pasa al repositorio la creación de la adopción
    await _repo.addAdopcion(
      idAnimal: adopcion.idAnimal,
      nombreAnimal: adopcion.nombreAnimal,
      chip: adopcion.chip,
      usuarioNombre: adopcion.usuarioNombre,
      usuarioEmail: adopcion.usuarioEmail,
      usuarioTelefono: adopcion.usuarioTelefono,
    );
    // Se actualiza el estado con la lista de adopciones
    state = AsyncData(await _repo.fetchAll());
  }

  // Método para eliminar una adopción por id del animal
  Future<void> removeAdopcion(String idAnimal) async {
    // Se pasa al repositorio la eliminación
    await _repo.removeAdopcion(idAnimal);
    // Se actualiza el estado con la lista completa de adopciones
    state = AsyncData(await _repo.fetchAll());
  }

  // Método para actualizar una adopción existente
  Future<void> updateAdopcion(Adopcion adopcion) async {
    // Se pasa al repositorio la actualización de los datos del adoptante
    await _repo.updateAdopcion(
      adopcion.idAnimal,
      usuarioNombre: adopcion.usuarioNombre,
      usuarioEmail: adopcion.usuarioEmail,
      usuarioTelefono: adopcion.usuarioTelefono,
    );
    // Se actualiza el estado con la lista completa de adopciones
    state = AsyncData(await _repo.fetchAll());
  }
}
