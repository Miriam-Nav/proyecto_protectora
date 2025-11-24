import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

// Enum con todas las variantes de tarjeta
enum AppVariant {
  primary,
  secondary,
  danger,
  success,
  warning,
  cardBlue,
  cardGreen,
  menuButton,
}

// Función que devuelve los colores según la variante
(Color, Color) eleccionVariante(AppPalette palette, AppVariant variant) {
  return switch (variant) {
    AppVariant.primary => (palette.primary, palette.onPrimary),
    AppVariant.secondary => (palette.secondary, palette.onSecondary),
    AppVariant.danger => (palette.danger, palette.onDanger),
    AppVariant.success => (palette.success, palette.onSuccess),
    AppVariant.warning => (palette.warning, palette.onWarning),
    AppVariant.cardBlue => (palette.cardBlue, palette.onCardBlue),
    AppVariant.cardGreen => (palette.cardGreen, palette.onCardGreen),
    AppVariant.menuButton => (palette.menuButton, palette.onMenuButton),
  };
}
