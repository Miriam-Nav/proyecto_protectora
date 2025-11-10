import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/data/animales_datafake.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/datos_usurio.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/demostracion_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/detalle_animal.dart';

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

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Novedades',
                style: Theme.of(context).textTheme.headlineSmall,
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
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DetalleAnimal(seleccionado: animalesFake[index].idAnimal,),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.only(top: 30, bottom: 25)),
          AppRoundedActionButton(
            label: 'Noticias y Eventos',
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => PaginaDemostracion())),
          ),
          Padding(padding: const EdgeInsets.only(top: 5, bottom: 25)),
          AppRoundedActionButton(
            label: 'Datos del usuario',
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => DatosUsurio())),
          ),
        ],
      ),
    );
  }
}
