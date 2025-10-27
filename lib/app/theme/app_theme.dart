import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

class AppTheme {
  static final TextTheme _textTheme = const TextTheme(
    headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
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

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF8F7F6),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF8F7F6),
      // Color del texto y los íconos
      foregroundColor: Colors.black,
      // Sin sombra
      elevation: 0,
      // Título centrado
      centerTitle: true,
      // Reaccion del AppBar al scroll
      surfaceTintColor: Color.fromARGB(255, 98, 89, 84),
    ),
    colorScheme: ColorScheme.light(
      primary: appPaletteLight.primary,
      onPrimary: appPaletteLight.onPrimary,
      secondary: appPaletteLight.secondary,
      onSecondary: appPaletteLight.onSecondary,
      error: appPaletteLight.danger,
      onError: appPaletteLight.onDanger,
    ),
    textTheme: _textTheme,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: appPaletteDark.primary,
      onPrimary: appPaletteDark.onPrimary,
      secondary: appPaletteDark.secondary,
      onSecondary: appPaletteDark.onSecondary,
      error: appPaletteDark.danger,
      onError: appPaletteDark.onDanger,
    ),
    textTheme: _textTheme,
  );
}
