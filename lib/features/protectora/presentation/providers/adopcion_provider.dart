import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/notifiers/adopcion_notifier.dart';
import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';

// Provider principal de adopciones
final adopcionesProvider =
    AsyncNotifierProvider<AdopcionesNotifier, List<Adopcion>>(() {
      return AdopcionesNotifier();
    });

// Total de adopciones
final totalAdopcionesProvider = Provider<int>((ref) {
  final adopciones = ref.watch(adopcionesProvider).value ?? const <Adopcion>[];
  return adopciones.length;
});

// Últimas 5 adopciones
final ultimasAdopcionesProvider = FutureProvider<List<Adopcion>>((ref) {
  final adopciones = ref.watch(adopcionesProvider).value ?? const <Adopcion>[];
  final total = adopciones.length;
  int startIndex = total - 5;
  if (startIndex < 0) {
    startIndex = 0;
  }
  return adopciones.sublist(startIndex, total);
});
