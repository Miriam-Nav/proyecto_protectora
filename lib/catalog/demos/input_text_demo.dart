import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';


class InputTextDemo extends StatelessWidget {
  const InputTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold /*ShowcaseScaffold*/ (
      // title: 'Botones',
      appBar: AppBar(title: const Text('Botones'), centerTitle: true),

      //
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          AppInputText(
            leadingIcon: Icons.pets,
            label: 'Nombre',
          ),
        ]
      ),
    );
  }
}
