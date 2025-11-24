import 'package:flutter/material.dart';

// Pantalla de carga inicial.
// Se muestra mientras la app arranca o carga datos.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Center: centra el contenido en la pantalla
      body: Center(
        // CircularProgressIndicator: animación de carga (spinner)
        child: CircularProgressIndicator(),
      ),
    );
  }
}
