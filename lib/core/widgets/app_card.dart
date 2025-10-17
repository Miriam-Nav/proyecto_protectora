import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';

enum AppCardVariant {
  primary,
  secondary,
  danger,
  success,
  warning,
  cardBlue,
  cardGreen,
}

/// Crea una card reutilizable que puede mostrar un icono o una imagen,
/// junto con título, subtítulo y una acción al pulsar.
class AppCard extends StatelessWidget {
  final String title; // Texto principal
  final String? subtitle; // Texto secundario opcional
  final IconData? icon; // Icono opcional
  final Image? image; // Imagen opcional
  final Color? color; // Color de fondo opcional
  final VoidCallback? onTap; // Acción al pulsar
  final AppCardVariant variant;
  const AppCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.image,
    this.color,
    this.onTap,
    this.variant = AppCardVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);
    final esModoOscuro = Theme.of(context).brightness == Brightness.dark;

    final (bg, fg) = switch (variant) {
      AppCardVariant.primary => (palette.primary, palette.onPrimary),
      AppCardVariant.secondary => (palette.secondary, palette.onSecondary),
      AppCardVariant.danger => (palette.danger, palette.onDanger),
      AppCardVariant.success => (palette.danger, palette.onDanger),
      AppCardVariant.warning => (palette.danger, palette.onDanger),
      AppCardVariant.cardBlue => (palette.cardBlue, palette.onCardBlue),
      AppCardVariant.cardGreen => (palette.cardGreen, palette.onCardGreen),
    };
    // Usa InkWell para permitir el efecto de pulsación
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: color ?? bg, // Usa color personalizado o el del tema
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4, // Da una pequeña sombra
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Muestra una imagen si existe, sino un icono
              if (image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(width: 60, height: 60, child: image),
                )
              else if (icon != null)
                Icon(icon, size: 48, color: color ?? fg),

              const SizedBox(width: 16),

              // Coloca el título y el subtítulo en una columna
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Muestra el título
                    Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: fg),
                    ),
                    // Si hay subtítulo, lo muestra
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: fg),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Card informativa con borde de color y una etiqueta (badge) arriba a la derecha.
class AppNotiCard extends StatelessWidget {
  final String title; // Ej: "Max - Adoptado"
  final String text; // Ej: "11/10/2025 - 16:32"
  final String badgeText; // Ej: "Adopción"
  final VoidCallback? onTap; // Acción al pulsar
  final AppCardVariant variant;

  const AppNotiCard({
    super.key,
    required this.title,
    required this.text,
    required this.badgeText,
    this.onTap,
    this.variant = AppCardVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);

    // Derivamos los colores de la variante
    final (baseColor, textColor) = switch (variant) {
      AppCardVariant.primary => (palette.primary, palette.onPrimary),
      AppCardVariant.secondary => (palette.secondary, palette.onSecondary),
      AppCardVariant.danger => (palette.danger, palette.onDanger),
      AppCardVariant.success => (palette.success, palette.onSuccess),
      AppCardVariant.warning => (palette.warning, palette.onWarning),
      AppCardVariant.cardBlue => (palette.cardBlue, palette.onCardBlue),
      AppCardVariant.cardGreen => (palette.cardGreen, palette.onCardGreen),
    };

    final esModoOscuro = Theme.of(context).brightness == Brightness.dark;

    // Capa blanca muy ligera
    final Color lightBackground = esModoOscuro
        ? baseColor.withAlpha((0.60 * 255).round())
        : baseColor.withAlpha((0.08 * 255).round()); // modo claro

    final Color darkerColor = esModoOscuro
        ? textColor
        : Color.alphaBlend(
            Colors.black.withAlpha(128), // 0.5 opacidad
            baseColor,
          );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: lightBackground, // color de fondo muy suave
          border: Border.all(color: baseColor, width: 1.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila con título y badge a la derecha
            Row(
              children: [
                // Icono
                Icon(Icons.info, color: darkerColor, size: 20),
                SizedBox(width: 6),
                // Título en negrita
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: darkerColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            // Texto inferior (fecha y hora, u otra info)
            Text(text, style: Theme.of(context).textTheme.bodyMedium),

            const SizedBox(height: 8),
            // Badge con fondo de color y bordes redondeados
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
              child: AppButton(
                label: 'Revisar',
                onPressed: () {},
                variant: AppButtonVariant.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Card informativa
class AppInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String badgeText;
  final VoidCallback? onTap;
  final AppCardVariant variant;

  const AppInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.badgeText,
    this.onTap,
    this.variant = AppCardVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);

    // Derivamos los colores de la variante
    final (baseColor, textColor) = switch (variant) {
      AppCardVariant.primary => (palette.primary, palette.onPrimary),
      AppCardVariant.secondary => (palette.secondary, palette.onSecondary),
      AppCardVariant.danger => (palette.danger, palette.onDanger),
      AppCardVariant.success => (palette.success, palette.onSuccess),
      AppCardVariant.warning => (palette.warning, palette.onWarning),
      AppCardVariant.cardBlue => (palette.cardBlue, palette.onCardBlue),
      AppCardVariant.cardGreen => (palette.cardGreen, palette.onCardGreen),
    };

    final esModoOscuro = Theme.of(context).brightness == Brightness.dark;
    final aclarado = esModoOscuro
        ? Color.alphaBlend(
            // equivale a 20% opacidad
            Colors.white.withAlpha((0.2 * 255).toInt()),
            baseColor,
          )
        : baseColor.withAlpha((0.60 * 255).round());

    final Color baseFuerte = baseColor.withAlpha((0.55 * 255).round()); // ≈217

    // Capa blanca muy ligera
    final Color lightBackground = esModoOscuro
        ? Color.alphaBlend(
            Colors.white.withAlpha((0.00 * 255).round()),
            baseFuerte,
          )
        : baseColor.withAlpha((0.0 * 255).round()); // modo claro

    // Franja de arriba.
    final Color stripColor = esModoOscuro
        ? Color.alphaBlend(
            Colors.white.withAlpha((0.35 * 255).round()), // 50% blanco
            baseColor,
          )
        : baseColor.withAlpha((0.10 * 255).round()); // 18% opacidad directa

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: lightBackground,
          border: Border.all(color: baseColor, width: 1.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- Franja superior ----
            Container(
              decoration: BoxDecoration(
                color: stripColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Título
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  // Boton de dentro
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: aclarado,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      badgeText,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ---- Parte inferior ----
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                subtitle,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
