import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltroNotifier extends Notifier<String?> {
  @override
  String? build() {
    // Estado inicial: sin filtro
    return null;
  }

  // Cambiar el filtro
  void setFiltro(String? nuevo) {
    state = nuevo;
  }

  // Limpiar el filtro
  void clearFiltro() {
    state = null;
  }
}

// Provider global del filtro
final filtroProvider = NotifierProvider<FiltroNotifier, String?>(
  () => FiltroNotifier(),
);
