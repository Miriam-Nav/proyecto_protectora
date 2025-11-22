import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/fav_animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/drawer_page.dart';

class FavAnimalesPage extends ConsumerWidget {
  const FavAnimalesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Set<Animales> favAnimales = ref.watch(favAnimalProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: customAppBar(context, l10n.favoritos, showDrawer: true),
      drawer: const ProtectoraDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: favAnimales.isEmpty
            ? Center(child: Text(l10n.noNoFavoritos))
            : ListView.builder(
                itemCount: favAnimales.length,
                itemBuilder: (BuildContext context, int index) {
                  final animal = favAnimales.toList()[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MascotaFavCard(
                          animal: animal,
                          onAdoptPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => FormularioAdopcion(
                                seleccionado: animal.idAnimal,
                              ),
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
    );
  }
}
