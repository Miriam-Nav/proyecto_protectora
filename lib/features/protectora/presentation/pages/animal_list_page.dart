import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/gradient_bg.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';

class AnimalListPage extends ConsumerWidget {
  const AnimalListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final animales = ref.watch(animalesProvider);
    return Scaffold(
      appBar: customAppBar(context, "Animales", showDrawer: true),
      drawer: const ProtectoraDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: animales.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
          data: (items) => ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final animal = items[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
