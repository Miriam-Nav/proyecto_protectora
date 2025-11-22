import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/app_card.dart';
import 'package:proyecto_protectora/features/protectora/data/models/noticia_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/data/fakes/noticias_datafake.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/detalle_animal.dart';

class ClientPage extends ConsumerWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    // Últimas 5 noticias
    List<Noticia> ultimasNoticias = [];
    int totalNot = noticiasFake.length;
    int startIndexNot = totalNot - 2;
    if (startIndexNot < 0) {
      startIndexNot = 0;
    }
    for (int i = startIndexNot; i < totalNot; i++) {
      ultimasNoticias.add(noticiasFake[i]);
    }

    final ultimosAnimales = ref.watch(ultimosAnimalesProvider);

    return Scaffold(
      appBar: customAppBar(context, l10n.appTitle, showDrawer: true),

      drawer: ProtectoraDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.novedades,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 15),
                ultimosAnimales.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error: $e')),
                  data: (animales) {
                    if (animales.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(l10n.noAnimalesRegistrados),
                      );
                    }

                    // Añade un comportamiento de desplazamiento
                    // personalizado que permite que todos los
                    // dispositivos puedan arrastrar la lista.
                    return ScrollConfiguration(
                      behavior: const MaterialScrollBehavior().copyWith(
                        dragDevices: {...PointerDeviceKind.values},
                      ),
                      child: SizedBox(
                        height: 175,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: animales.length,
                          itemBuilder: (context, index) {
                            final animal = animales[index];
                            return SizedBox(
                              height: 175,
                              width: 150,
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: MascotaMiniCard(
                                  image: animal.foto,
                                  title: animal.nombre,
                                  text: animal.descripcion,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => DetalleAnimal(
                                          seleccionado: animal.idAnimal,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              l10n.noticiasEventos,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 15),
            // LISTA
            Column(
              children: ultimasNoticias.isEmpty
                  ? [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(l10n.noNoticias, textAlign: TextAlign.left),
                      ),
                    ]
                  : ultimasNoticias.map((noticia) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: NoticiaCard(noticia: noticia),
                      );
                    }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
