import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/app/theme/app_variants.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/fav_animal_provider.dart';

// Card grande para mostrar información detallada de una mascota
class MascotaFavCard extends ConsumerWidget {
  final Animales animal;
  final AppVariant variant;
  // Mostrar botón de adoptar
  final bool showAdoptButton;
  // Mostrar icono de favorito
  final bool showFavoriteIcon;
  // Acción al pulsar adoptar
  final VoidCallback? onPressed;

  const MascotaFavCard({
    super.key,
    required this.animal,
    this.variant = AppVariant.menuButton,
    this.onPressed,
    this.showAdoptButton = false,
    this.showFavoriteIcon = false,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Paleta de colores
    final palette = appPaletteOf(context);
    // Lista de favoritos
    final favAnimals = ref.watch(favAnimalProvider);
    // Textos traducidos
    final l10n = AppLocalizations.of(context)!;

    // Card principal que envuelve todo el contenido
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: palette.primary, width: 2),
      ),
      elevation: 4,
      child: Container(
        // Fondo y bordes internos de la Card
        decoration: BoxDecoration(
          color: palette.menuButton,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Contenedor de imagen y datos
            SizedBox(
              width: 410,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen principal del animal
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        width: 410,
                        height: 290,
                        child: Image.network(animal.foto, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Nombre del animal
                  Text(
                    animal.nombre,
                    textAlign: TextAlign.left,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(color: palette.primary),
                  ),
                  const SizedBox(height: 15),

                  // Sexo del animal
                  Wrap(
                    children: [
                      Text(
                        '🟠 ${l10n.sexoAnimal}: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        animal.sexo == Sexo.macho ? l10n.macho : l10n.hembra,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Raza del animal
                  Wrap(
                    children: [
                      Text(
                        '🟠 ${l10n.razaAnimal}: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        animal.raza,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Fecha de nacimiento
                  Wrap(
                    children: [
                      Text(
                        '🟠 ${l10n.fechaNacimiento}: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(animal.fNacimiento),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Estado de esterilización
                  Wrap(
                    children: [
                      Text(
                        '🟠 ${l10n.esterelizadoAnimal}: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        animal.esterilizado ? l10n.si : l10n.no,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Número de chip
                  Wrap(
                    children: [
                      Text(
                        '🟠 ${l10n.chipAnimal}: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        animal.chip.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Descripción del animal
                  Wrap(
                    children: [
                      Text(
                        '🟠 ${l10n.descripcionAnimal}: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        animal.descripcion,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Botones de acción (adoptar y favorito)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Botón de adoptar
                      if (showAdoptButton)
                        AppButtonBorde(
                          label: l10n.adoptar,
                          onPressed: onPressed,
                          borderColor: appPaletteOf(context).cardGreen,
                        ),
                      // Icono de favorito
                      if (showFavoriteIcon)
                        IconButton(
                          icon: favAnimals.contains(animal)
                              ? const Icon(Icons.favorite, color: Colors.red)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            // Notifier que tiene los métodos para añadir o quitar animales de la lista de favoritos.
                            final notifier = ref.read(
                              favAnimalProvider.notifier,
                            );
                            if (favAnimals.contains(animal)) {
                              notifier.removeAnimal(animal);
                            } else {
                              notifier.addAnimal(animal);
                            }
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Card pequeña para mostrar datos base de la mascota
class MascotaMiniCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final VoidCallback? onPressed;
  final AppVariant variant;
  // Color de fondo opcional
  final Color? backgroundColorOverride;
  // Color de texto opcional
  final Color? foregroundColorOverride;

  const MascotaMiniCard({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.onPressed,
    this.variant = AppVariant.menuButton,
    this.backgroundColorOverride,
    this.foregroundColorOverride,
  });

  @override
  Widget build(BuildContext context) {
    // Paleta de colores de la app
    final palette = appPaletteOf(context);
    // Colores base según la variante elegida
    final (baseColor, textColor) = eleccionVariante(palette, variant);

    // Botón elevado que envuelve toda la card
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Si no se elige inngun color se usa el baseColor y textColor
        backgroundColor: backgroundColorOverride ?? baseColor,
        foregroundColor: foregroundColorOverride ?? textColor,
        padding: const EdgeInsets.only(top: 15, bottom: 5, right: 15, left: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen pequeña de la mascota
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox(
                width: 110,
                height: 90,
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 5),

          // Título de la card
          Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 1),

          // Texto descriptivo de la card
          Text(
            text,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
