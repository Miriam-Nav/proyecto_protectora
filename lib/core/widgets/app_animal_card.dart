import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/auth/data/models/animal_model.dart';
import 'package:proyecto_protectora/features/auth/presentation/providers/fav_animal_provider.dart';

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
  final Animal animal;
  final AppMascotaCardVariant variant;
  final VoidCallback? onAdoptPressed; // callback desde AnimalListPage

  const MascotaFavCard({
    super.key,
    required this.animal,
    this.variant = AppMascotaCardVariant.menuButton,
    this.onAdoptPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = appPaletteOf(context);
    final favAnimals = ref.watch(favAnimalProvider);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: palette.primary, width: 2), // borde naranja
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
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
                        child: Image.asset(animal.foto, fit: BoxFit.cover),
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
                  Row(
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
                  Row(
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
                  Row(
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
                  Row(
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
                  Row(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                  const SizedBox(height: 12),

                  // Botones al final
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        label: 'Adoptar',
                        onPressed: onAdoptPressed,
                        variant: AppButtonVariant.primary,
                      ),
                      IconButton(
                        icon: favAnimals.contains(animal)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          final notifier = ref.read(favAnimalProvider.notifier);
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

class MascotaCard extends StatelessWidget {
  final String image;
  final String nombre;
  final String sexo;
  final String raza;
  final String fNacimiento;
  final String esterilizado;
  final String chip;
  final String text;
  final String? tipo;
  final AppMascotaCardVariant variant;

  /// Overrides opcionales por si queremos forzar colores puntuales.
  final Color? backgroundColorOverride;
  final Color? foregroundColorOverride;
  
  

  const MascotaCard({
    super.key,
    required this.image,
    required this.nombre,
    required this.sexo,
    required this.raza,
    required this.fNacimiento,
    required this.esterilizado,
    required this.chip,
    required this.text,
    this.tipo,
    this.variant = AppMascotaCardVariant.menuButton,
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
                        child: Image.asset(image, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Text(
                    nombre,
                    textAlign: TextAlign.left,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(color: palette.primary),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        '🟠 Sexo: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(sexo, style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '🟠 Raza: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(raza, style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '🟠 Tipo: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(tipo!, style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '🟠 Fecha de nacimiento: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        fNacimiento,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '🟠 Esterilizado: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        esterilizado,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '🟠 Chip: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(chip, style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '🟠 Descripción: ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Expanded(
                        child: Text(
                          text,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
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
                child: Image.asset(image, fit: BoxFit.cover),
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
