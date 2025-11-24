import 'package:proyecto_protectora/features/preferences/data/models/preferences.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  // Claves utilizadas para almacenar los valores
  static const _keyDarkMode = 'DARKMODE';
  static const _keyLanguage = 'LANGUAGE';

  // Obtiene las preferencias almacenadas
  Future<Preferences> getPreferences() async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();

    // Recupera el valor de modo oscuro, por defecto false
    bool darkmodeAlm = preferenciasAlmacenadas.getBool(_keyDarkMode) ?? false;

    // Recupera el idioma, por defecto español
    Locale languageAlm = Locale(
      preferenciasAlmacenadas.getString(_keyLanguage) ?? 'es',
    );

    // Devuelve un objeto Preferences
    return Preferences(darkmode: darkmodeAlm, language: languageAlm);
  }

  Future<void> setPreferences(Preferences preferences) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();

    // Almacena el valor de modo oscuro
    preferenciasAlmacenadas.setBool(_keyDarkMode, preferences.darkmode);

    // Almacena el código de idioma
    preferenciasAlmacenadas.setString(
      _keyLanguage,
      preferences.language.languageCode,
    );
  }

  // Actualiza solo la preferencia de modo oscuro
  Future<void> setDarkMode(bool darkmode) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();
    preferenciasAlmacenadas.setBool(_keyDarkMode, darkmode);
  }

  // Actualiza solo la preferencia de idioma
  Future<void> setLanguage(String languageCode) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();
    preferenciasAlmacenadas.setString(_keyLanguage, languageCode);
  }
}
