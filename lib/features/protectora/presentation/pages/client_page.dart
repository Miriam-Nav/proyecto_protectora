import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/app_card.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/data/animales_datafake.dart';

// Pagina que se muestra del boton del home
class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(l10n.appTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),

      drawer: ProtectoraDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  'Protectora-Adopción',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 14),
              ],
            ),

            SizedBox(height: 5),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Novedades',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 15),
                ScrollConfiguration(
                  // Añade un comportamiento de desplazamiento
                  // personalizado que permite que todos los
                  // dispositivos puedan arrastrar la lista.
                  behavior: const MaterialScrollBehavior().copyWith(
                    dragDevices: {...PointerDeviceKind.values},
                  ),
                  child: SizedBox(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: animalesFake.length,
                      itemBuilder: (context, index) {
                        final animal = animalesFake[index];
                        return SizedBox(
                          height: 200,
                          width: 150,
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            child: MascotaMiniCard(
                              image: animal.foto,
                              title: animal.nombre,
                              text: animal.descripcion,
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            Column(
              children: [
                Text(
                  'Noticias y Eventos',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
