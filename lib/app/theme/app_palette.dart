import 'package:flutter/material.dart';

class AppPalette {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color danger;
  final Color onDanger;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color cardBlue;
  final Color onCardBlue;
  final Color cardGreen;
  final Color onCardGreen;

  const AppPalette({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.danger,
    required this.onDanger,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.cardBlue,
    required this.onCardBlue,
    required this.cardGreen,
    required this.onCardGreen,
  });
}

/// Paleta para tema claro
const appPaletteLight = AppPalette(
  primary: Color.fromARGB(238, 238, 124, 43),
  onPrimary: Colors.white,
  secondary: Colors.black87,
  onSecondary: Colors.white,
  danger: Color(0xFFD92D20),
  onDanger: Colors.white,
  success: Color.fromARGB(237, 101, 255, 77),
  onSuccess: Colors.white,
  warning: Color.fromARGB(237, 238, 231, 43),
  onWarning: Colors.white,
  cardBlue: Color.fromARGB(255, 26, 135, 225),
  onCardBlue: Colors.black87,
  cardGreen: Color.fromARGB(255, 60, 197, 65),
  onCardGreen: Colors.black87,
);

/// Paleta para tema oscuro (ajusta los contrastes)
const appPaletteDark = AppPalette(
  primary: Color.fromARGB(238, 238, 124, 43),
  onPrimary: Colors.white,
  secondary: Colors.white,
  onSecondary: Colors.black87,
  danger: Color(0xFFFF7A6E),
  onDanger: Color(0xFF0B0B0B),
  success: Color.fromARGB(236, 123, 253, 103),
  onSuccess: Colors.white,
  warning: Color.fromARGB(236, 249, 244, 84),
  onWarning: Colors.white,
  cardBlue: Color.fromARGB(255, 27, 121, 197),
  onCardBlue: Colors.white,
  cardGreen: Color.fromARGB(255, 18, 173, 23),
  onCardGreen: Colors.white,
);

/// Devuelve la paleta adecuada según el brillo del tema activo.
AppPalette appPaletteOf(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? appPaletteDark : appPaletteLight;
}
