import 'package:flutter/material.dart';
import 'package:proyecto_protectora/catalog/demos/buttons_demo.dart';
import 'package:proyecto_protectora/catalog/demos/cards_demo.dart';
import 'package:proyecto_protectora/catalog/demos/input_text_demo.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

// Pantalla que muestra un catálogo de componentes de la app.
class CatalogPag extends StatelessWidget {
  const CatalogPag({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: estructura básica de una pantalla en Flutter
    return Scaffold(
      // AppBar personalizado con el título de la página
      appBar: customAppBar(context, 'Catálogo de Componentes'),

      // El cuerpo de la pantalla se envuelve en una lista
      body: ListView(
        children: [
          // Opción para ver la demo de botones
          ListTile(
            title: const Text('Botones'),
            subtitle: const Text('Variantes, estados y tamaños'),
            trailing: const Icon(Icons.chevron_right),
            // Al pulsar, se navega a la pantalla ButtonsDemo
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => ButtonsDemo()));
            },
          ),

          const SizedBox(height: 8),

          // Opción para ver la demo de cards
          ListTile(
            title: const Text('Cards'),
            subtitle: const Text('Variantes, estados y tamaños'),
            trailing: const Icon(Icons.chevron_right),
            // Al pulsar, se navega a la pantalla CardsDemo
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const CardsDemo()));
            },
          ),

          const SizedBox(height: 8),

          // Opción para ver la demo de inputs
          ListTile(
            title: const Text('Inputs'),
            subtitle: const Text('Variantes, estados y tamaños'),
            trailing: const Icon(Icons.chevron_right),
            // Al pulsar, se navega a la pantalla InputTextDemo
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const InputTextDemo()));
            },
          ),
        ],
      ),
    );
  }
}
