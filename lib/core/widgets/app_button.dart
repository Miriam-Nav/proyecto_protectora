import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

enum AppButtonVariant {
  primary,
  secondary,
  danger,
  success,
  warning,
  menuButton,
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  /// Overrides opcionales por si queremos forzar colores puntuales.
  final Color? backgroundColorOverride;
  final Color? foregroundColorOverride;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.backgroundColorOverride,
    this.foregroundColorOverride,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);

    final (bg, fg) = switch (variant) {
      AppButtonVariant.primary => (palette.primary, palette.onPrimary),
      AppButtonVariant.secondary => (palette.secondary, palette.onSecondary),
      AppButtonVariant.danger => (palette.danger, palette.onDanger),
      AppButtonVariant.success => (palette.success, palette.onSuccess),
      AppButtonVariant.warning => (palette.warning, palette.onWarning),
      AppButtonVariant.menuButton => (palette.menuButton, palette.onMenuButton),
    };

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColorOverride ?? bg,
        foregroundColor: foregroundColorOverride ?? fg,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

/// Botón ancho con bordes redondeados a la izquierda
class AppRoundedActionButton extends StatelessWidget {
  final IconData? leadingIcon;
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  const AppRoundedActionButton({
    super.key,
    this.leadingIcon,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);

    // Selecciona colores según el tipo de botón
    final (bg, fg) = switch (variant) {
      AppButtonVariant.primary => (palette.primary, palette.onPrimary),
      AppButtonVariant.secondary => (palette.secondary, palette.onSecondary),
      AppButtonVariant.danger => (palette.danger, palette.onDanger),
      AppButtonVariant.success => (palette.success, palette.onSuccess),
      AppButtonVariant.warning => (palette.warning, palette.onWarning),
      AppButtonVariant.menuButton => (palette.menuButton, palette.onMenuButton),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 3,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(leadingIcon, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData? leadingIcon;
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  /// Overrides opcionales por si queremos forzar colores puntuales.
  final Color? backgroundColorOverride;
  final Color? foregroundColorOverride;

  const MenuButton({
    super.key,
    this.leadingIcon,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.menuButton,
    this.backgroundColorOverride,
    this.foregroundColorOverride,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);

    final (bg, fg) = switch (variant) {
      AppButtonVariant.primary => (palette.primary, palette.onPrimary),
      AppButtonVariant.secondary => (palette.secondary, palette.onSecondary),
      AppButtonVariant.danger => (palette.danger, palette.onDanger),
      AppButtonVariant.success => (palette.success, palette.onSuccess),
      AppButtonVariant.warning => (palette.warning, palette.onWarning),
      AppButtonVariant.menuButton => (palette.menuButton, palette.onMenuButton),
    };

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColorOverride ?? bg,
        foregroundColor: foregroundColorOverride ?? fg,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(leadingIcon, size: 28),
          const SizedBox(height: 5),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
