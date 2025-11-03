import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/auth/data/models/animal_model.dart';

class FavAnimalNotifier extends Notifier<Set<Animal>> {
  @override
  Set<Animal> build() {
    return const {};
  }

  void addAnimal(Animal animal) {
    if (!state.contains(animal)) {
      state = {...state, animal};
    }
  }

  void removeAnimal(Animal animal) {
    if (state.contains(animal)) {
      state = state.where((a) => a.idAnimal != animal.idAnimal).toSet();
    }
  }
}

final favAnimalProvider = NotifierProvider<FavAnimalNotifier, Set<Animal>>(() {
  return FavAnimalNotifier();
});

final totalPerrosProvider = Provider<int>((ref) {
  final totalFav = ref
      .watch(favAnimalProvider)
      .toList()
      .where((animal) => animal.tipo.contains("Perro"))
      .length;
  return totalFav;
});
