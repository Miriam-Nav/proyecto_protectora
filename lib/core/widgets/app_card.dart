import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/models/noticia_model.dart';

enum AppCardVariant {
  primary,
  secondary,
  danger,
  success,
  warning,
  cardBlue,
  cardGreen,
  menuButton,
}

(Color, Color) eleccionColoresVariante(
  AppPalette palette,
  AppCardVariant variant,
) {
  return switch (variant) {
    AppCardVariant.primary => (palette.primary, palette.onPrimary),
    AppCardVariant.secondary => (palette.secondary, palette.onSecondary),
    AppCardVariant.danger => (palette.danger, palette.onDanger),
    AppCardVariant.success => (palette.success, palette.onSuccess),
    AppCardVariant.warning => (palette.warning, palette.onWarning),
    AppCardVariant.cardBlue => (palette.cardBlue, palette.onCardBlue),
    AppCardVariant.cardGreen => (palette.cardGreen, palette.onCardGreen),
    AppCardVariant.menuButton => (palette.menuButton, palette.onMenuButton),
  };
}

/// Crea una card reutilizable que puede mostrar un icono o una imagen
class AppCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Image? image;
  final Color? color;
  final VoidCallback? onTap;
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

    final (bg, fg) = eleccionColoresVariante(palette, variant);
    // Usa InkWell para permitir el efecto de pulsación
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        // Usa color personalizado o el del tema
        color: color ?? bg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // Da una pequeña sombra
        elevation: 4,
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

/// Card informativa
class AppInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String badgeText;
  final VoidCallback? onTap;
  final AppCardVariant variant;

  const AppInfoCard( {
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
    final (baseColor, textColor) = eleccionColoresVariante(palette, variant);
    final esModoOscuro = Theme.of(context).brightness == Brightness.dark;
    final Color baseFuerte = baseColor.withAlpha((0.55 * 255).round()); // ≈217

    final aclarado = esModoOscuro
        ? baseColor.withAlpha((0.80 * 255).round())
        : baseFuerte;

    // Fondo con capa blanca muy ligera
    final Color lightBackground = esModoOscuro
        ? baseFuerte.withAlpha((0.05 * 255).round())
        : appPaletteOf(
            context,
          ).menuButton.withAlpha((0.8 * 255).round()); // modo claro

    // Franja de arriba.
    final Color stripColor = esModoOscuro
        ? baseColor.withAlpha((0.40 * 255).round())
        : baseColor.withAlpha((0.20 * 255).round());

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
              width: double.infinity,
              decoration: BoxDecoration(
                color: stripColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Wrap(
                spacing: 8, // espacio horizontal entre elementos
                runSpacing: 4, // espacio vertical entre líneas
                alignment: WrapAlignment.spaceBetween,
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
                      style: Theme.of(context).textTheme.labelLarge,
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

// Card de notificacion.
class AppNotiCard extends StatelessWidget {
  final String title;
  final String text;
  final String badgeText;
  final VoidCallback? onTap;
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

    final (baseColor, textColor) = eleccionColoresVariante(palette, variant);

    final esModoOscuro = Theme.of(context).brightness == Brightness.dark;

    // Capa blanca muy ligera
    final Color lightBackground = esModoOscuro
        ? baseColor.withAlpha((0.60 * 255).round())
        : baseColor.withAlpha((0.08 * 255).round()); // modo claro

    final Color darkerColor = esModoOscuro
        ? textColor
        : Color.alphaBlend(
            // 0.5 opacidad
            appPaletteDark.background.withAlpha(128),
            baseColor,
          );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // color de fondo muy suave
          color: lightBackground,
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
            // Texto inferior
            Text(text, style: Theme.of(context).textTheme.bodyMedium),

            const SizedBox(height: 8),
            // Etiqueta
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

// Card de noticias.
class NoticiaCard extends StatelessWidget {
  final Noticia noticia;
  final AppCardVariant variant;

  /// Overrides opcionales por si queremos forzar colores puntuales.
  final Color? backgroundColorOverride;
  final Color? foregroundColorOverride;

  const NoticiaCard({
    super.key,
    required this.noticia,
    this.variant = AppCardVariant.menuButton,
    this.backgroundColorOverride,
    this.foregroundColorOverride,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);
    final (baseColor, textColor) = eleccionColoresVariante(palette, variant);

    return Card(
      color: backgroundColorOverride ?? baseColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: palette.primary, width: 2),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      width: 400,
                      height: 200,
                      child: Image.network(noticia.imagen, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  noticia.titulo,
                  textAlign: TextAlign.left,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: palette.primary),
                ),
                const SizedBox(height: 15),

                Text(
                  noticia.texto,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
