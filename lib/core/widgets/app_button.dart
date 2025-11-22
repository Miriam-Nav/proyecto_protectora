import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

enum AppButtonVariant {
  primary,
  secondary,
  danger,
  success,
  warning,
  cardGreen,
  menuButton,
}

(Color, Color) eleccionColoresVariante(
  AppPalette palette,
  AppButtonVariant variant,
) {
  return switch (variant) {
    AppButtonVariant.primary => (palette.primary, palette.onPrimary),
    AppButtonVariant.secondary => (palette.secondary, palette.onSecondary),
    AppButtonVariant.danger => (palette.danger, palette.onDanger),
    AppButtonVariant.success => (palette.success, palette.onSuccess),
    AppButtonVariant.warning => (palette.warning, palette.onWarning),
    AppButtonVariant.cardGreen => (palette.cardGreen, palette.onCardGreen),
    AppButtonVariant.menuButton => (palette.menuButton, palette.onMenuButton),
  };
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final double rounded;

  /// Overrides opcionales por si queremos forzar colores puntuales.
  final Color? backgroundColorOverride;
  final Color? foregroundColorOverride;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.rounded = 15,
    this.backgroundColorOverride,
    this.foregroundColorOverride,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);

    final (baseColor, textColor) = eleccionColoresVariante(palette, variant);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColorOverride ?? baseColor,
        foregroundColor: foregroundColorOverride ?? textColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rounded),
        ),
      ),
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 28),
                const SizedBox(width: 8),
                Text(label),
              ],
            )
          : Text(label),
    );
  }
}

class AppButtonBorde extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color borderColor;
  final double rounded;

  const AppButtonBorde({
    super.key,
    required this.label,
    this.onPressed,
    required this.borderColor,
    this.rounded = 15,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: appPaletteOf(context).menuButton,
        foregroundColor: borderColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rounded),
          side: BorderSide(color: borderColor, width: 2),
        ),
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
  final Color? bgColor;
  final Color? txColor;

  const AppRoundedActionButton({
    super.key,
    this.leadingIcon,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.bgColor,
    this.txColor,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);

    final (baseColor, textColor) = eleccionColoresVariante(palette, variant);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? baseColor,
          foregroundColor: txColor ?? textColor,
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

class AppRoundedActionButtonBorde extends StatelessWidget {
  final IconData? leadingIcon;
  final String label;
  final VoidCallback? onPressed;
  final Color borderColor;

  const AppRoundedActionButtonBorde({
    super.key,
    this.leadingIcon,
    required this.label,
    required this.onPressed,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: onPressed,
        style:
            ElevatedButton.styleFrom(
              foregroundColor: borderColor,
              backgroundColor: appPaletteOf(context).menuButton,
              elevation: 3,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                side: BorderSide(color: borderColor, width: 2),
              ),
            ).copyWith(
              overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.hovered)) {
                  return appPaletteOf(
                    context,
                  ).onMenuButton.withAlpha((0.05 * 255).toInt());
                }
                if (states.contains(WidgetState.pressed)) {
                  return appPaletteOf(
                    context,
                  ).onMenuButton.withAlpha((0.1 * 255).toInt());
                }
                return null;
              }),
            ),
        child: Row(
          children: [
            if (leadingIcon != null) Icon(leadingIcon, size: 28),
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

    final (baseColor, textColor) = eleccionColoresVariante(palette, variant);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColorOverride ?? baseColor,
        foregroundColor: foregroundColorOverride ?? textColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      // Icono con gradiente
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: appPaletteOf(context).primary,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          leadingIcon,
          color: appPaletteOf(context).onPrimary,
          size: 24,
        ),
      ),
    );
  }
}
