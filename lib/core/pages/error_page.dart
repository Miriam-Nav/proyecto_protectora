import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Pantalla que muestra un mensaje de error.
// Recibe un texto con la descripción del error.
class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El contenido se centra en la pantalla
      body: Center(
        // Se añade un padding alrededor del contenido
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // Se organiza el contenido en una columna
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Texto indicando que ocurrió un error
              const Text('Ha ocurrido un error'),

              const SizedBox(height: 12),

              // Texto con el detalle del error recibido
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.redAccent),
              ),

              const SizedBox(height: 24),

              // Botón para volver
              ElevatedButton(
                onPressed: () {
                  context.findAncestorWidgetOfExactType<ProviderScope>();
                },
                child: const Text('Volver'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
