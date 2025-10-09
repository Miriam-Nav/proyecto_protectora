import 'package:flutter/material.dart';
import 'demos/buttons_demo.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz visual del widget
    return Scaffold(
      // Usa Scaffold como estructura básica de la pantalla
      appBar: AppBar(title: const Text('Catálogo de Componentes')),
      // Crea un ListView para permitir scroll vertical
      body: ListView(
        children: [
          // Añade un elemento de lista: Botones
          ListTile(
            // Muestra el texto principal de la fila
            title: const Text('Botones'),
            // Muestra un icono al final de la fila
            trailing: const Icon(Icons.arrow_forward_ios),
            // Define la acción al pulsar la fila
            onTap: () {
              Navigator.push(
                context,
                // Crea la transición a la nueva pantalla
                MaterialPageRoute(
                  builder: (_) =>
                      // Abre la pantalla ButtonsDemo
                      const ButtonsDemo(),
                ),
              );
            },
          ),
          // Añadir más listas ....
        ],
      ),
    );
  }
}
