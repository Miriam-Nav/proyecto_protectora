import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/gradient_bg.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class DetalleAnimal extends ConsumerWidget {
  final String seleccionado;

  const DetalleAnimal({super.key, required this.seleccionado});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalesAsync = ref.watch(animalesProvider);

    return animalesAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (animales) {
        final animal = animales.firstWhere(
          (animales) => animales.idAnimal == seleccionado,
          orElse: () => throw Exception('Animal no encontrado'),
        );

        return Scaffold(
          appBar: customAppBar(context, 'Conoce a ${animal.nombre}'),

          
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    MascotaFavCard(
                      animal: animal,
                      onAdoptPressed: () => Navigator.of(context).push(
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
