import 'package:proyecto_protectora/features/preferences/data/models/preferences.dart';
import 'package:proyecto_protectora/features/preferences/data/repositories/preferences_repository.dart';

class PreferencesUseCases {
  final Future<Preferences> Function() getPreferences;
  final Future<void> Function(Preferences preferences) setPreferences;

  PreferencesUseCases(PreferencesRepository repo)
    : getPreferences = repo.getPreferences,
      setPreferences = repo.setPreferences;
}
