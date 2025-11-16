import 'package:flutter/material.dart';
import 'package:proyecto_protectora/catalog/demos/buttons_demo.dart';
import 'package:proyecto_protectora/catalog/demos/cards_demo.dart';
import 'package:proyecto_protectora/catalog/demos/input_text_demo.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Componentes'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Botones'),
            subtitle: const Text('Variantes, estados y tamaños'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => ButtonsDemo()));
            },
          ),

          const SizedBox(height: 8),
          ListTile(
            title: const Text('Cards'),
            subtitle: const Text('Variantes, estados y tamaños'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const CardsDemo()));
            },
          ),

          const SizedBox(height: 8),
          ListTile(
            title: const Text('Inputs'),
            subtitle: const Text('Variantes, estados y tamaños'),
            trailing: const Icon(Icons.chevron_right),
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
