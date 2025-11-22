import 'package:proyecto_protectora/features/preferences/data/models/preferences.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  static const _keyDarkMode = 'DARKMODE';
  static const _keyLanguage = 'LANGUAGE';

  Future<Preferences> getPreferences() async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();
    bool darkmodeAlm = preferenciasAlmacenadas.getBool(_keyDarkMode) ?? false;
    Locale languageAlm = Locale(
      preferenciasAlmacenadas.getString(_keyLanguage) ?? 'es',
    );

    return Preferences(darkmode: darkmodeAlm, language: languageAlm);
  }

  Future<void> setPreferences(Preferences preferences) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();
    preferenciasAlmacenadas.setBool(_keyDarkMode, preferences.darkmode);
    preferenciasAlmacenadas.setString(
      _keyLanguage,
      preferences.language.languageCode,
    );
  }

  Future<void> setDarkMode(bool darkmode) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();
    preferenciasAlmacenadas.setBool(_keyDarkMode, darkmode);
  }

  Future<void> setLanguage(String languageCode) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();
    preferenciasAlmacenadas.setString(_keyLanguage, languageCode);
  }
}
