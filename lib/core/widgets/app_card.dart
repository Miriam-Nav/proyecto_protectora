import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/app/theme/app_variants.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/models/noticia_model.dart';

/// Card Informativa de Acciones
class AppInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String badgeText;
  final VoidCallback? onTap;
  final AppVariant variant;

  const AppInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.badgeText,
    this.onTap,
    this.variant = AppVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);
    final esModoOscuro = Theme.of(context).brightness == Brightness.dark;

    // Deriva los colores de la variante
    final (baseColor, textColor) = eleccionVariante(palette, variant);

    // Color transparente más vivo
    final Color baseFuerte = baseColor.withAlpha((0.55 * 255).round());

    final badge = esModoOscuro
        ? baseColor.withAlpha((0.80 * 255).round())
        : baseFuerte;

    // Fondo con capa blanca muy ligera
    final Color fondoClaro = esModoOscuro
        ? baseFuerte.withAlpha((0.05 * 255).round())
        : appPaletteOf(
            context,
          ).menuButton.withAlpha((0.8 * 255).round()); // modo claro

    // Franja de arriba.
    final Color stripColor = esModoOscuro
        ? baseColor.withAlpha((0.40 * 255).round())
        : baseColor.withAlpha((0.20 * 255).round());

    // Contenedor clicable
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),

      // Caja principal con fondo y borde
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: fondoClaro,
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
              // Wrap para organizar título y badge
              child: Wrap(
                // Espacio horizontal entre elementos
                spacing: 8,
                // Espacio vertical entre líneas
                runSpacing: 4,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  // Título principal
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: textColor),
                  ),

                  // Etiqueta dentro de la franja
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: badge,
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
              // Texto descriptivo o subtítulo
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

// Card de Notificacion.
class AppNotiCard extends StatelessWidget {
  final String title;
  final String text;
  final AppVariant variant;
  final AppButton? button;

  const AppNotiCard({
    super.key,
    required this.title,
    required this.text,
    this.variant = AppVariant.primary,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    final palette = appPaletteOf(context);

    final (baseColor, textColor) = eleccionVariante(palette, variant);

    final esModoOscuro = Theme.of(context).brightness == Brightness.dark;

    // Capa blanca muy ligera
    final Color fondoClaro = esModoOscuro
        ? baseColor.withAlpha((0.60 * 255).round())
        : baseColor.withAlpha((0.08 * 255).round()); // modo claro

    // Color para el título
    final Color darkerColor = esModoOscuro
        ? textColor
        : Color.alphaBlend(
            // 0.5 opacidad
            appPaletteDark.background.withAlpha(128),
            baseColor,
          );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color de fondo muy suave
        color: fondoClaro,
        border: Border.all(color: baseColor, width: 1.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fila con título y badge a la izquierda
          Row(
            children: [
              // Icono
              Icon(Icons.info, color: darkerColor, size: 20),
              SizedBox(width: 6),
              // Título en negrita
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: darkerColor),
              ),
            ],
          ),

          const SizedBox(height: 8),
          // Texto inferior
          Text(text, style: Theme.of(context).textTheme.bodyLarge),

          const SizedBox(height: 8),
          // Etiqu  eta
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
            child: button,
          ),
        ],
      ),
    );
  }
}

// Card de Noticias.
class NoticiaCard extends StatelessWidget {
  // Objeto noticia con datos
  final Noticia noticia;
  // Variante de estilo para colores
  final AppVariant variant;

  // Overrides opcionales para forzar colores puntuales
  final Color? bgColor;
  final Color? txColor;

  const NoticiaCard({
    super.key,
    required this.noticia,
    this.variant = AppVariant.menuButton,
    this.bgColor,
    this.txColor,
  });

  @override
  Widget build(BuildContext context) {
    // Paleta de colores de la app
    final palette = appPaletteOf(context);
    // Colores base según la variante elegida
    final (baseColor, textColor) = eleccionVariante(palette, variant);

    // Tarjeta principal con borde y sombra
    return Card(
      color: bgColor ?? baseColor,
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
                // Imagen de la noticia
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

                // Título de la noticia
                Text(
                  noticia.titulo,
                  textAlign: TextAlign.left,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: palette.primary),
                ),
                const SizedBox(height: 15),

                // Texto de la noticia
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
