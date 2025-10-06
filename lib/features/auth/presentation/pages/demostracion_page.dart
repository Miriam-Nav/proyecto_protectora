import 'package:flutter/material.dart';

class PaginaDemostracion extends StatelessWidget {
  const PaginaDemostracion({super.key});

  @override
  Widget build(BuildContext context) {
    final brillo = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(title: const Text('Demostración')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.palette, size: 64),
            const SizedBox(height: 12),
            Text('Tema actual: ${brillo == Brightness.dark ? 'Oscuro' : 'Claro'}'),
            const SizedBox(height: 8),
            const Text(
              'Cambia el interruptor en Ajustes y vuelve aquí.\n'
              'La preferencia persiste entre reinicios.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
