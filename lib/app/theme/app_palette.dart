import 'package:flutter/material.dart';

class AppPalette {
  final Color background;
  final Color primary;
  final Color onPrimary;
  final Color degradado;
  final Color onDegradado;
  final Color secondary;
  final Color onSecondary;
  final Color danger;
  final Color onDanger;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color menuButton;
  final Color onMenuButton;
  final Color cardBlue;
  final Color onCardBlue;
  final Color cardGreen;
  final Color onCardGreen;

  const AppPalette({
    required this.background,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.degradado,
    required this.onDegradado,
    required this.danger,
    required this.onDanger,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.menuButton,
    required this.onMenuButton,
    required this.cardBlue,
    required this.onCardBlue,
    required this.cardGreen,
    required this.onCardGreen,
  });
}

/// Paleta para tema claro
const appPaletteLight = AppPalette(
  background: Color.fromARGB(255, 248, 246, 239),
  primary: Color(0xFFFF6F00),
  onPrimary: Colors.white,
  degradado: Color.fromARGB(255, 253, 176, 10),
  onDegradado: Color.fromARGB(255, 255, 135, 23),
  secondary: Color.fromARGB(255, 30, 29, 29),
  onSecondary: Colors.white,
  danger: Color(0xFFD92D20),
  onDanger: Colors.white,
  success: Color.fromARGB(237, 101, 255, 77),
  onSuccess: Colors.white,
  warning: Color.fromARGB(237, 238, 231, 43),
  onWarning: Colors.white,
  menuButton: Colors.white,
  onMenuButton: Color.fromARGB(255, 30, 29, 29),
  cardBlue: Color.fromARGB(255, 26, 135, 225),
  onCardBlue: Color.fromARGB(255, 30, 29, 29),
  cardGreen: Color.fromARGB(255, 60, 197, 65),
  onCardGreen: Color.fromARGB(255, 30, 29, 29),
);

/// Paleta para tema oscuro
const appPaletteDark = AppPalette(
  background: Color.fromARGB(255, 28, 21, 38),
  primary: Color.fromARGB(255, 255, 201, 53),
  onPrimary: Colors.white,
  degradado: Color.fromARGB(255, 195, 10, 0),
  onDegradado: Color.fromARGB(255, 252, 129, 53),
  secondary: Colors.white,
  onSecondary: Color.fromARGB(255, 30, 29, 29),
  danger: Color.fromARGB(255, 244, 73, 58),
  onDanger: Colors.white,
  success: Color.fromARGB(236, 123, 253, 103),
  onSuccess: Colors.white,
  warning: Color.fromARGB(236, 249, 244, 84),
  onWarning: Colors.white,
  menuButton: Color.fromARGB(255, 47, 33, 52),
  onMenuButton: Colors.white,
  cardBlue: Color.fromARGB(255, 42, 148, 236),
  onCardBlue: Colors.white,
  cardGreen: Color.fromARGB(255, 36, 211, 41),
  onCardGreen: Colors.white,
);

/// Devuelve la paleta adecuada según el brillo del tema activo.
AppPalette appPaletteOf(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? appPaletteDark : appPaletteLight;
}
