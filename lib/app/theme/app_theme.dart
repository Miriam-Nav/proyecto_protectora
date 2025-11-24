import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

// Clase que define los temas de la app
// tanto para el modo claro como para el modo oscuro.
class AppTheme {
  static final TextTheme _textTheme = const TextTheme(
    headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),

    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),

    bodyLarge: TextStyle(fontSize: 16, height: 1.4),
    bodyMedium: TextStyle(fontSize: 14, height: 1.4),
    bodySmall: TextStyle(fontSize: 12, height: 1.4),

    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    labelSmall: TextStyle(fontSize: 11, letterSpacing: 0.2),
  );

  // Tema claro de la app.
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // Color de fondo principal
    scaffoldBackgroundColor: appPaletteLight.background,

    // Configuración del AppBar en modo claro
    appBarTheme: AppBarTheme(
      backgroundColor: appPaletteLight.primary,
      // Color del texto y los íconos
      foregroundColor: appPaletteLight.onPrimary,
      // Sin sombra
      elevation: 0,

      // Reaccion del AppBar al scroll
      surfaceTintColor: Colors.transparent,

      // Estilo del título del AppBar
      titleTextStyle: _textTheme.headlineLarge?.copyWith(
        color: appPaletteLight.onPrimary,
      ),
    ),

    // Esquema de colores para modo claro
    colorScheme: ColorScheme.light(
      primary: appPaletteLight.primary,
      onPrimary: appPaletteLight.onPrimary,
      secondary: appPaletteLight.secondary,
      onSecondary: appPaletteLight.onSecondary,
      error: appPaletteLight.danger,
      onError: appPaletteLight.onDanger,
    ),

    // Tipografía aplicada en todo el tema
    textTheme: _textTheme,
  );

  // Tema oscuro de la app.
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Color de fondo principal
    scaffoldBackgroundColor: appPaletteDark.background,

    // Configuración del AppBar en modo oscuro
    appBarTheme: AppBarTheme(
      // Color de fondo del AppBar
      backgroundColor: appPaletteDark.primary,

      // Reacción del AppBar al scroll
      surfaceTintColor: Colors.transparent,

      // Estilo del título del AppBar
      titleTextStyle: _textTheme.headlineLarge?.copyWith(
        color: appPaletteDark.onMenuButton,
      ),
    ),

    // Esquema de colores para modo oscuro
    colorScheme: ColorScheme.dark(
      primary: appPaletteDark.primary,
      onPrimary: appPaletteDark.onPrimary,
      secondary: appPaletteDark.secondary,
      onSecondary: appPaletteDark.onSecondary,
      error: appPaletteDark.danger,
      onError: appPaletteDark.onDanger,
    ),

    // Tipografía aplicada en todo el tema
    textTheme: _textTheme,
  );
}
