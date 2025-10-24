import 'package:proyecto_protectora/features/auth/data/datasources/preferences_local_datasource.dart';
import 'package:proyecto_protectora/features/preferences/data/models/preferences.dart';
import 'package:proyecto_protectora/features/preferences/data/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesLocalDataSource localDatasource;

  PreferencesRepositoryImpl(this.localDatasource);

  @override
  Future<Preferences> getPreferences() async {
    final preferenciasAlmacenadas = await localDatasource.fetchPreferences();
    bool darkmodeAlm =
        preferenciasAlmacenadas.getBool(Preferences.darkModeConst) ?? false;
    String languageAlm =
        preferenciasAlmacenadas.getString(Preferences.languageConst) ?? 'es';
    return Preferences(darkmode: darkmodeAlm, language: languageAlm);
  }

  @override
  Future<void> setPreferences(Preferences preferences) async {
    await localDatasource.savePreferences(preferences);
  }
}
