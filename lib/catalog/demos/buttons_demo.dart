import 'package:flutter/material.dart';

class ButtonsDemo extends StatefulWidget {
  const ButtonsDemo({super.key});
  // Crea el estado asociado
  @override
  State<ButtonsDemo> createState() => _ButtonsDemoState();
}

// Define la clase de estado _ButtonsDemoState
class _ButtonsDemoState extends State<ButtonsDemo> {
  // Declara una variable para controlar si el botón está en estado de carga
  bool isLoading = false;

  // Declara variables de estado para los botones que muestran carga
  bool isLoadingPrimary = false;
  bool isLoadingTonal = false;

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz visual del widget
    return Scaffold(
      appBar: AppBar(title: const Text('Botones')),
      body: Center(
        child: Padding(
          // Añade padding alrededor de todo el contenido
          padding: const EdgeInsets.all(16),
          // Coloca los widgets en columna
          child: Column(
            crossAxisAlignment:
                // Estira los botones horizontalmente
                CrossAxisAlignment.center,
            children: [
              // ---- BOTON 1 ----
              // Añade un ElevatedButton con estado de carga
              ElevatedButton(
                onPressed: isLoading
                    ? null // Desactiva el botón si isLoading es true
                    : () async {
                        // Activa el estado de carga
                        setState(() => isLoading = true);
                        // Simula una operación de 2 segundos
                        await Future.delayed(const Duration(seconds: 2));
                        // Desactiva el estado de carga
                        setState(() => isLoading = false);
                      },
                style: ElevatedButton.styleFrom(
                  // Define color de fondo azul
                  backgroundColor: Colors.blue,
                ),
                child: isLoading
                    ? const SizedBox(
                        // Muestra un indicador de carga si isLoading es true
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white, // Color del spinner
                          strokeWidth: 2, // Grosor del spinner
                        ),
                      )
                    : const Text('Boton 1'),
              ),

              const SizedBox(height: 12),

              // ---- BOTON 2 ----
              // Añade un OutlinedButton
              OutlinedButton(
                onPressed: () {}, // Acción vacía
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.teal, // Color del texto
                  side: const BorderSide(
                    color: Colors.teal,
                  ), // Borde color teal
                ),
                child: const Text('Boton 2'), // Texto del botón
              ),

              const SizedBox(height: 12),

              // ---- BOTON 3 ----
              // Añade un TextButton
              TextButton(
                onPressed: () {}, // Acción vacía
                child: const Text('Boton 3'), // Texto del botón
              ),

              const SizedBox(height: 12),

              // ---- BOTON 4 ----
              // Añade un ElevatedButton deshabilitado
              ElevatedButton(
                onPressed: null, // null indica que está deshabilitado
                child: const Text('Boton 4'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
