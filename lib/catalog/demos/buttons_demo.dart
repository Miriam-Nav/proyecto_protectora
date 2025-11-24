import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/app/theme/app_variants.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Botones'),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('AppButton – Botón de Acción'),
          const SizedBox(height: 8),
          AppRoundedActionButton(
            icono: Icons.pets,
            label: 'Registrar Nuevo Animal',
            onPressed: () {},
          ),

          const Text('AppButton – Botón de Acción con Borde'),
          const SizedBox(height: 8),
          AppRoundedActionButtonBorde(
            icono: Icons.favorite_border,
            label: 'Registrar Nueva Adopción',
            onPressed: () {},
            borderColor: appPaletteOf(context).primary,
          ),

          const Text('AppButton – Boton de Adoptar'),
          const SizedBox(height: 8),
          AppButtonBorde(
            label: 'Adoptar',
            onPressed: () {},
            borderColor: appPaletteOf(context).cardGreen,
          ),

          const Text('AppButton – Botón de Aceptar'),
          const SizedBox(height: 8),
          AppButton(
            label: 'Confirmar',
            onPressed: () {},
            variant: AppVariant.primary,
          ),

          const SizedBox(height: 16),
          const Text('AppButton – Botón de Cancelar'),
          const SizedBox(height: 8),
          AppButton(
            label: 'Cancelar',
            onPressed: () {},
            variant: AppVariant.secondary,
          ),
          const SizedBox(height: 16),
          const Text('AppButton – Botón de Eliminar'),
          const SizedBox(height: 8),
          AppButton(
            label: 'Eliminar',
            onPressed: () {},
            variant: AppVariant.danger,
          ),

          const SizedBox(height: 16),
          const Text('AppButton – Botón Deshabilitado'),
          const SizedBox(height: 8),
          AppButton(
            label: 'No disponible',
            onPressed: null,
            variant: AppVariant.primary,
          ),
        ],
      ),
    );
  }
}
