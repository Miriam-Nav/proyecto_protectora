import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/preferences/data/models/preferencias.dart';
import 'package:proyecto_protectora/features/preferences/data/repositories/preferencias_repository.dart';

final preferencesProvider =
    AsyncNotifierProvider<PreferencesNotifier, Preferences>(() {
      return PreferencesNotifier();
    });

// Maneja las preferencias de la aplicación
class PreferencesNotifier extends AsyncNotifier<Preferences> {
  // Repositorio que gestiona la persistencia de las preferencias
  late final PreferencesRepository _repo;

  @override
  Future<Preferences> build() async {
    // Inicialización del repositorio y carga de las preferencias actuales
    _repo = PreferencesRepository();
    return _repo.getPreferences();
  }

  // Método para actualizar el idioma de la aplicación
  Future<void> setLocale(Locale locale) async {
    try {
      // Estado de carga mientras se actualiza
      state = const AsyncLoading();
      // Persistencia del nuevo idioma
      await _repo.setLanguage(locale.languageCode);
      // Recarga de las preferencias actualizadas
      Preferences updatedPrefs = await _repo.getPreferences();
      // Estado actualizado con las nuevas preferencias
      state = AsyncValue.data(updatedPrefs);
    } catch (e, st) {
      // Estado de error en caso de fallo
      state = AsyncError(e, st);
    }
  }

  // Método para actualizar todas las preferencias
  Future<void> updatePreferences(Preferences newPreferences) async {
    try {
      // Estado de carga mientras se actualiza
      state = const AsyncLoading();
      // Persistencia de las nuevas preferencias
      await _repo.setPreferences(newPreferences);
      // Estado actualizado con las preferencias recibidas
      state = AsyncValue.data(newPreferences);
    } catch (e, st) {
      // Estado de error en caso de fallo
      state = AsyncError(e, st);
    }
  }
}
