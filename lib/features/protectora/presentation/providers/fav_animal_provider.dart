import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales_model.dart';

class FavAnimalNotifier extends Notifier<Set<Animales>> {
  @override
  Set<Animales> build() {
    // Estado inicial: conjunto vacío
    return const {};
  }

  // Añadir un animal a favoritos
  void addAnimal(Animales animal) {
    if (!state.contains(animal)) {
      // Se crea una copia del estado actual
      final nuevo = Set<Animales>.from(state);
      // Se añade el nuevo animal
      nuevo.add(animal);
      // Se actualiza el estado con el nuevo estado
      state = nuevo;
    }
  }

  // Eliminar un animal de favoritos
  void removeAnimal(Animales animal) {
    if (state.contains(animal)) {
      // Se busca el eliminando el animal por id
      state = state.where((a) => a.idAnimal != animal.idAnimal).toSet();
    }
  }
}

// Provider que muestra los animales favoritos
final favAnimalProvider = NotifierProvider<FavAnimalNotifier, Set<Animales>>(
  () {
    return FavAnimalNotifier();
  },
);
