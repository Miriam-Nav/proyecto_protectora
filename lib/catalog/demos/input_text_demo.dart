import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class InputTextDemo extends StatelessWidget {
  const InputTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Inputs'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---- INPUT BÁSICO ----
          const Text('AppInputText – Campo básico con icono'),
          const SizedBox(height: 8),
          const AppInputText(leadingIcon: Icons.pets, label: 'Nombre'),

          const SizedBox(height: 20),

          // ---- INPUT CON VALIDACIÓN ----
          const Text('AppInputText – Con validación simple'),
          const SizedBox(height: 8),
          AppInputText(
            leadingIcon: Icons.badge,
            label: 'Chip',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El chip es obligatorio';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          // ---- SELECT ----
          const Text('AppInputSelect – Selector de opciones'),
          const SizedBox(height: 8),
          AppInputSelect<String>(
            label: 'Tipo de animal',
            value: 'Perro',
            items: const ['Perro', 'Gato', 'Ave'],
            itemLabel: (item) => item,
            onChanged: (val) => print('Seleccionado: $val'),
          ),
        ],
      ),
    );
  }
}
