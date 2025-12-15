import 'package:proyecto_protectora/features/preferences/data/models/preferencias.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  // Claves utilizadas para almacenar los valores
  static const _keyModoOscuro = 'DARKMODE';
  static const _keyIdioma = 'LANGUAGE';

  // Obtiene las preferencias almacenadas
  Future<Preferences> getPreferences() async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();

    // Recupera el valor de modo oscuro, por defecto false
    bool darkmodeAlm = preferenciasAlmacenadas.getBool(_keyModoOscuro) ?? false;

    // Recupera el idioma, por defecto español
    Locale idiomaAlm = Locale(
      preferenciasAlmacenadas.getString(_keyIdioma) ?? 'es',
    );

    // Devuelve un objeto Preferences
    return Preferences(modoOscuro: darkmodeAlm, idioma: idiomaAlm);
  }

  Future<void> setPreferences(Preferences preferences) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();

    // Almacena el valor de modo oscuro
    preferenciasAlmacenadas.setBool(_keyModoOscuro, preferences.modoOscuro);

    // Almacena el código de idioma
    preferenciasAlmacenadas.setString(
      _keyIdioma,
      preferences.idioma.languageCode,
    );
  }

  // Actualiza solo la preferencia de modo oscuro
  Future<void> setDarkMode(bool modoOscuro) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();
    preferenciasAlmacenadas.setBool(_keyModoOscuro, modoOscuro);
  }

  // Actualiza solo la preferencia de idioma
  Future<void> setLanguage(String languageCode) async {
    final preferenciasAlmacenadas = await SharedPreferences.getInstance();
    preferenciasAlmacenadas.setString(_keyIdioma, languageCode);
  }
}
