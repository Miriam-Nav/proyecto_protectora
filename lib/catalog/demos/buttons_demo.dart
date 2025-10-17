import 'package:flutter/material.dart';
// import 'package:proyecto_protectora/catalog/widgets/showcase_scaffold.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold /*ShowcaseScaffold*/ (
      // title: 'Botones',
      appBar: AppBar(title: const Text('Botones'), centerTitle: true),

      //
      body: ListView(
        // padding: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(100),
        children: [
          const Text('AppButton – Animal'),
          const SizedBox(height: 8),
          AppRoundedActionButton(
            leadingIcon: Icons.pets,
            label: 'Registrar Nuevo Animal',
            onPressed: () {},
          ),

          const Text('AppButton – Adopción'),
          const SizedBox(height: 8),
          AppRoundedActionButton(
            leadingIcon: Icons.favorite_border,
            label: 'Registrar Nueva Adopción',
            onPressed: () {},
          ),

          const Text('AppButton – Veterinario'),
          const SizedBox(height: 8),
          AppRoundedActionButton(
            leadingIcon: Icons.medical_services_outlined,
            label: 'Registrar Visita Veterinario',
            onPressed: () {},
          ),

          const Text('AppButton – Primary'),
          const SizedBox(height: 8),
          AppButton(
            label: 'Confirmar',
            onPressed: () {},
            variant: AppButtonVariant.primary,
          ),

          const SizedBox(height: 16),
          const Text('AppButton – Secondary'),
          const SizedBox(height: 8),
          AppButton(
            label: 'Cancelar',
            onPressed: () {},
            variant: AppButtonVariant.secondary,
          ),
          const SizedBox(height: 16),
          const Text('AppButton – Peligro'),
          const SizedBox(height: 8),
          AppButton(
            label: 'Peligro',
            onPressed: () {},
            variant: AppButtonVariant.danger,
          ),

          const SizedBox(height: 16),
          const Text('AppButton – Disabled'),
          const SizedBox(height: 8),
          AppButton(
            label: 'No disponible',
            onPressed: null,
            variant: AppButtonVariant.primary,
          ),
        ],
      ),
    );
  }
}
