import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/controllers/animal_controller.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';

class AnimalListPage extends ConsumerWidget {
  const AnimalListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final animales = ref.watch(animalesProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(l10n.appTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      drawer: const ProtectoraDrawer(),
      body: animales.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (items) => ListView.separated(
          itemCount: items.length,
          padding: const EdgeInsets.only(left: 15, right: 15),
          separatorBuilder: (_, _) => const Divider(height: 25),
          itemBuilder: (context, i) {
            final animal = items[i];
            return MascotaFavCard(
              animal: animal,
              // onChanged: (_) {
              //   ref.watch(animalesProvider.notifier).getOne(animal.idAnimal);
              // },
              onAdoptPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      FormularioAdopcion(sleccionado: animal.idAnimal),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}