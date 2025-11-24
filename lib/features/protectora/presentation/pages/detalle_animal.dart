import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class DetalleAnimal extends ConsumerWidget {
  final String seleccionado;

  const DetalleAnimal({super.key, required this.seleccionado});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider que devuelve la lista de animales
    final animalesAsync = ref.watch(animalesProvider);
    final l10n = AppLocalizations.of(context)!;

    // Manejo de estados del provider
    return animalesAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (animales) {
        // Busca el animal con id que coincide con el seleccionado
        final animal = animales.firstWhere(
          (animales) => animales.idAnimal == seleccionado,
          orElse: () => throw Exception(l10n.animalNoEncontrado),
        );

        // Crea la pantalla con los datos del animal
        return Scaffold(
          appBar: customAppBar(context, '${l10n.conocer} ${animal.nombre}'),

          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    // Card con la información del animal
                    MascotaFavCard(
                      animal: animal,
                      // Al pulsar el botón de adoptar navega al formulario
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              FormularioAdopcion(seleccionado: animal.idAnimal),
                        ),
                      ),
                      showAdoptButton: true,
                      showFavoriteIcon: true,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
