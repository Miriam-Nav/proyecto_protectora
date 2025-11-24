import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/controllers/animal_notifier.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales_model.dart';

// Provider principal
final animalesProvider =
    AsyncNotifierProvider<AnimalesNotifier, List<Animales>>(() {
      return AnimalesNotifier();
    });

// Total de animales
final totalAnimalesProvider = Provider<int>((ref) {
  final animales = ref.watch(animalesProvider).value ?? const <Animales>[];
  return animales.length;
});

// Últimos 5 animales
final ultimosAnimalesProvider = FutureProvider<List<Animales>>((ref) {
  final animales = ref.watch(animalesProvider).value ?? const <Animales>[];
  final total = animales.length;
  int startIndex = total - 5;
  if (startIndex < 0) {
    startIndex = 0;
  }
  return animales.sublist(startIndex, total);
});
