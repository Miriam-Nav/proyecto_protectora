import 'package:flutter/material.dart';

class AppPalette {
  final Color background;
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
  background: Color(0xFFF8F7F6),
  primary: Color.fromARGB(238, 238, 124, 43),
  onPrimary: Colors.white,
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

/// Paleta para tema oscuro (ajusta los contrastes)
const appPaletteDark = AppPalette(
  background: Color.fromARGB(255, 30, 29, 29),
  primary: Color.fromARGB(238, 238, 124, 43),
  onPrimary: Colors.white,
  secondary: Colors.white,
  onSecondary: Color.fromARGB(255, 30, 29, 29),
  danger: Color(0xFFFF7A6E),
  onDanger: Color.fromARGB(255, 30, 29, 29),
  success: Color.fromARGB(236, 123, 253, 103),
  onSuccess: Colors.white,
  warning: Color.fromARGB(236, 249, 244, 84),
  onWarning: Colors.white,
  menuButton: Color.fromARGB(255, 30, 29, 29),
  onMenuButton: Colors.white,
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
