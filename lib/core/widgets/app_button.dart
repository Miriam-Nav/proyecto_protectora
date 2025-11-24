import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/app/theme/app_variants.dart';

// Botón estándar con variantes de color y opción de icono
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppVariant variant;
  final IconData? icon;
  // Radio de borde opcional
  final double rounded;
  // Colores opcionales
  final Color? bgColor;
  final Color? txColor;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppVariant.primary,
    this.icon,
    this.rounded = 15,
    this.bgColor,
    this.txColor,
  });

  @override
  Widget build(BuildContext context) {
    // Paleta de colores de la app
    final palette = appPaletteOf(context);
    // Colores según la variante
    final (baseColor, textColor) = eleccionVariante(palette, variant);

    // Botón con estilo y contenido
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Si no se elige inngun color se usa el baseColor y textColor
        backgroundColor: bgColor ?? baseColor,
        foregroundColor: txColor ?? textColor,

        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        // Borde redondeado a elección
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rounded),
        ),
      ),
      onPressed: onPressed,
      // Si hay icono, se muestra un Row con icono + texto
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icono del botón
                Icon(icon, size: 28),
                // Espacio entre icono y texto
                const SizedBox(width: 8),
                // Texto del botón
                Text(label),
              ],
            )
          // Si no hay icono, solo se muestra el texto
          : Text(label),
    );
  }
}

// Botón con borde coloreado y fondo neutro
class AppButtonBorde extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  // Color del borde
  final Color borderColor;
  // Radio de borde redondeado
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
    // Botón elevado con borde personalizado
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: appPaletteOf(context).menuButton,
        foregroundColor: borderColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        // Borde redondeado a elección
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

// Botón con bordes redondeados a la izquierda y flecha a la derecha
class AppRoundedActionButton extends StatelessWidget {
  final IconData? icono;
  final String label;
  final VoidCallback? onPressed;
  final AppVariant variant;
  // Color de fondo opcional
  final Color? bgColor;
  // Color de texto opcional
  final Color? txColor;

  const AppRoundedActionButton({
    super.key,
    this.icono,
    required this.label,
    required this.onPressed,
    this.variant = AppVariant.primary,
    this.bgColor,
    this.txColor,
  });

  @override
  Widget build(BuildContext context) {
    // Paleta de colores de la app
    final palette = appPaletteOf(context);
    // Colores según la variante
    final (baseColor, textColor) = eleccionVariante(palette, variant);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      // Botón elevado con forma redondeada a la izquierda
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // Colores de fondo y texto
          backgroundColor: bgColor ?? baseColor,
          foregroundColor: txColor ?? textColor,
          elevation: 3,

          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          // Forma del botón con bordes redondeados a la izquierda
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        // Contenido del botón en fila
        child: Row(
          children: [
            // Icono inicial
            Icon(icono, size: 28),
            const SizedBox(width: 16),
            // Texto expandido para ocupar espacio disponible
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Icono de flecha al final
            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}

// Botón ancho con borde coloreado y efectos de hover/pressed
class AppRoundedActionButtonBorde extends StatelessWidget {
  // Icono opcional
  final IconData? icono;
  // Texto del botón
  final String label;
  // Acción al pulsar
  final VoidCallback? onPressed;
  // Color del borde
  final Color borderColor;

  const AppRoundedActionButtonBorde({
    super.key,
    this.icono,
    required this.label,
    required this.onPressed,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      // Botón
      child: ElevatedButton(
        onPressed: onPressed,
        style:
            ElevatedButton.styleFrom(
              // Colores base del botón
              foregroundColor: borderColor,
              backgroundColor: appPaletteOf(context).menuButton,
              elevation: 3,

              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

              // Forma del botón con bordes redondeados a la izquierda y borde coloreado
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                side: BorderSide(color: borderColor, width: 2),
              ),
            )
            // Efectos visuales al pasar el ratón o pulsar
            .copyWith(
              // overlayColor define el color que aparece al interactuar con el botón
              overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                // Si el botón está en estado "hovered" (ratón encima)
                if (states.contains(WidgetState.hovered)) {
                  return appPaletteOf(
                    context,
                  ).onMenuButton.withAlpha((0.05 * 255).toInt());
                }
                // Si el botón está en estado "pressed" (clic pulsado)
                if (states.contains(WidgetState.pressed)) {
                  return appPaletteOf(
                    context,
                  ).onMenuButton.withAlpha((0.1 * 255).toInt());
                }
                // Si no está en ninguno de esos estados, no aplica color extra
                return null;
              }),
            ),

        // Contenido del botón
        child: Row(
          children: [
            // Icono si existe
            if (icono != null) Icon(icono, size: 28),
            const SizedBox(width: 16),
            // Texto expandido para ocupar espacio disponible
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Icono de flecha al final
            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}
