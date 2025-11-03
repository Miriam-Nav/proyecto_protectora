import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/preferences/data/models/preferences.dart';
import 'package:proyecto_protectora/features/preferences/data/repositories/preferences_repository.dart';

final preferencesProvider =
    AsyncNotifierProvider<PreferencesNotifier, Preferences>(() {
      return PreferencesNotifier();
    });

class PreferencesNotifier extends AsyncNotifier<Preferences> {
  late final PreferencesRepository _repo;

  @override
  Future<Preferences> build() async {
    _repo = PreferencesRepository();
    return _repo.getPreferences();
  }

  Future<void> setLocale(Locale locale) async {
    try {
      state = const AsyncLoading();
      await _repo.setLanguage(locale.languageCode);
      Preferences updatedPrefs = await _repo.getPreferences();
      state = AsyncValue.data(updatedPrefs);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updatePreferences(Preferences newPreferences) async {
    try {
      state = const AsyncLoading();
      await _repo.setPreferences(newPreferences);
      state = AsyncValue.data(newPreferences);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
