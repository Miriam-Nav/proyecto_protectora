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
          const SizedBox(height: 8),
          AppInputText(leadingIcon: Icons.pets, label: 'Nombre'),
        ],
      ),
    );
  }
}
