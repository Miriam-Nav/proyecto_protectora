import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/controllers/animal_controller.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/datos_usurio.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/demostracion_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/detalle_animal.dart';

// Pagina que se muestra del boton del home
class ClientPage extends ConsumerWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final animalesAsync = ref.watch(animalesProvider);

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
          Text('Novedades', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 15),

          animalesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (animales) => SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: animales.length,
                itemBuilder: (context, index) {
                  final animal = animales[index];
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
                              builder: (_) => DetalleAnimal(
                                seleccionado: animal.idAnimal,
                                nombreAnimal: animal.nombre,
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
