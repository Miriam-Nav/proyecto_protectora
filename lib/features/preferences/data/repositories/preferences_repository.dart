import 'package:proyecto_protectora/features/preferences/data/models/preferences.dart';

abstract class PreferencesRepository {
  Future<Preferences> getPreferences();
  Future<void> setPreferences(Preferences preferences);
}
