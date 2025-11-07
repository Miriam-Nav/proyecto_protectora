import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/data/animales_datafake.dart';

class AnimalListPage extends StatelessWidget {
  const AnimalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITULO
            Text(
              'Protectora-Adopción',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 14),

            // SUBTITULO
            Text('Animales', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 15),

            // LISTA
            Expanded(
              child: ListView.builder(
                itemCount: animalesFake.length,
                itemBuilder: (context, index) {
                  final animal = animalesFake[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MascotaFavCard(
                      animal: animal,
                      onAdoptPressed: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
