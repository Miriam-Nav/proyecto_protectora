import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/fav_animal_provider.dart';

enum AppMascotaCardVariant {
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
  AppMascotaCardVariant variant,
) {
  return switch (variant) {
    AppMascotaCardVariant.primary => (palette.primary, palette.onPrimary),
    AppMascotaCardVariant.secondary => (palette.secondary, palette.onSecondary),
    AppMascotaCardVariant.danger => (palette.danger, palette.onDanger),
    AppMascotaCardVariant.success => (palette.success, palette.onSuccess),
    AppMascotaCardVariant.warning => (palette.warning, palette.onWarning),
    AppMascotaCardVariant.cardBlue => (palette.cardBlue, palette.onCardBlue),
    AppMascotaCardVariant.cardGreen => (palette.cardGreen, palette.onCardGreen),
    AppMascotaCardVariant.menuButton => (
      palette.menuButton,
      palette.onMenuButton,
    ),
  };
}

class MascotaFavCard extends ConsumerWidget {
  final Animales animal;
  final AppMascotaCardVariant variant;
  final bool showAdoptButton;
  final bool showFavoriteIcon;
  final VoidCallback? onAdoptPressed;

  const MascotaFavCard({
    super.key,
    required this.animal,
    this.variant = AppMascotaCardVariant.menuButton,
    this.onAdoptPressed,
    this.showAdoptButton = false,
    this.showFavoriteIcon = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = appPaletteOf(context);
    final favAnimals = ref.watch(favAnimalProvider);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: palette.primary, width: 2),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          color: palette.menuButton,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen
            SizedBox(
              width: 410,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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

                  // Nombre
                  Text(
                    animal.nombre,
                    textAlign: TextAlign.left,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(color: palette.primary),
                  ),
                  const SizedBox(height: 15),

                  // Datos del animal
                  Wrap(
                    children: [
                      Text(
                        '🟠 Sexo: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        animal.sexo,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    children: [
                      Text(
                        '🟠 Raza: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        animal.raza,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    children: [
                      Text(
                        '🟠 Fecha de nacimiento: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        animal.fNacimiento,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    children: [
                      Text(
                        '🟠 Esterilizado: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        animal.estereilizado,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    children: [
                      Text(
                        '🟠 Chip: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        animal.chip,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    children: [
                      Text(
                        '🟠 Descripción: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          animal.descripcion,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Botones al final
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (showAdoptButton)
                        AppButtonBorde(
                          label: 'Adoptar',
                          onPressed: onAdoptPressed,
                          borderColor: appPaletteOf(context).cardGreen,
                        ),
                      if (showFavoriteIcon)
                        IconButton(
                          icon: favAnimals.contains(animal)
                              ? const Icon(Icons.favorite, color: Colors.red)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
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

class MascotaMiniCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final VoidCallback? onPressed;
  final AppMascotaCardVariant variant;

  /// Overrides opcionales por si queremos forzar colores puntuales.
  final Color? backgroundColorOverride;
  final Color? foregroundColorOverride;

  const MascotaMiniCard({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.onPressed,
    this.variant = AppMascotaCardVariant.menuButton,
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
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 5,
          right: 15,
          left: 15,
        ), //const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox(
                width: 110,
                height: 90,
                child: Image.network(image, fit: BoxFit.cover),
                //Image.asset(image, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 1),
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
