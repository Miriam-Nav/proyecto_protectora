import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';

class FavAnimalNotifier extends Notifier<Set<Animales>> {
  @override
  Set<Animales> build() {
    return const {};
  }

  void addAnimal(Animales animal) {
    if (!state.contains(animal)) {
      state = {...state, animal};
    }
  }

  void removeAnimal(Animales animal) {
    if (state.contains(animal)) {
      state = state.where((a) => a.idAnimal != animal.idAnimal).toSet();
    }
  }
}

final favAnimalProvider = NotifierProvider<FavAnimalNotifier, Set<Animales>>(
  () {
    return FavAnimalNotifier();
  },
);

final totalPerrosProvider = Provider<int>((ref) {
  final totalFav = ref
      .watch(favAnimalProvider)
      .toList()
      .where((animal) => animal.tipo.contains("Perro"))
      .length;
  return totalFav;
});
