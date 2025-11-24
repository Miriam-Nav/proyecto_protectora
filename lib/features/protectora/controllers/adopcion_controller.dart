import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_variants.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/adopcion_provider.dart';

class AdopcionController {
  final nombreCtrl = TextEditingController();
  final apellido1Ctrl = TextEditingController();
  final apellido2Ctrl = TextEditingController();
  final dniCtrl = TextEditingController();
  final telefonoCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final direccionCtrl = TextEditingController();
  final cpCtrl = TextEditingController();
  final localidadCtrl = TextEditingController();
  final provinciaCtrl = TextEditingController();

  Animales? animalSeleccionado;

  // Método para cargar el animal elegido
  void cargarAnimal(Animales animal) {
    animalSeleccionado = animal;
  }

  // Método para limpiar todos los campos y la selección
  void limpiar() {
    animalSeleccionado = null;
    nombreCtrl.clear();
    apellido1Ctrl.clear();
    apellido2Ctrl.clear();
    dniCtrl.clear();
    telefonoCtrl.clear();
    emailCtrl.clear();
    direccionCtrl.clear();
    cpCtrl.clear();
    localidadCtrl.clear();
    provinciaCtrl.clear();
  }

  // Método para liberar los recursos de los controladores
  void dispose() {
    nombreCtrl.dispose();
    apellido1Ctrl.dispose();
    apellido2Ctrl.dispose();
    dniCtrl.dispose();
    telefonoCtrl.dispose();
    emailCtrl.dispose();
    direccionCtrl.dispose();
    cpCtrl.dispose();
    localidadCtrl.dispose();
    provinciaCtrl.dispose();
  }

  // Método para crear una nueva solicitud de adopción
  Future<void> crearAdopcion(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;

    // Si no hay animal seleccionado se muestra un mensaje de error
    if (animalSeleccionado == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.noAnimalSelect)));
      return;
    }

    // Se construye el objeto Adopcion con los datos del formulario
    final adopcion = Adopcion(
      idAnimal: animalSeleccionado!.idAnimal,
      nombreAnimal: animalSeleccionado!.nombre,
      chip: animalSeleccionado!.chip.toString(),
      usuarioNombre:
          "${nombreCtrl.text} ${apellido1Ctrl.text} ${apellido2Ctrl.text}",
      usuarioEmail: emailCtrl.text,
      usuarioTelefono: telefonoCtrl.text,
      fechaAdopcion: DateTime.now(),
    );

    // Se añade la adopción al provider
    await ref.read(adopcionesProvider.notifier).addAdopcion(adopcion);

    // Se muestra un mensaje de confirmación
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.solicitudCreada)));

    // Se limpian los campos tras crear la solicitud
    limpiar();
  }

  // Método para eliminar una solicitud de adopción
  Future<void> eliminarAdopcion(
    WidgetRef ref,
    BuildContext context,
    String idAnimal,
  ) async {
    final l10n = AppLocalizations.of(context)!;

    // Se muestra un diálogo de confirmación
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.confirmarEliminacion),
        content: Text(l10n.preguntEliAdop),
        actions: [
          // Botón de cancelar
          AppButton(
            onPressed: () => Navigator.of(context).pop(false),
            label: l10n.cancelar,
            variant: AppVariant.secondary,
          ),
          // Botón de eliminar
          AppButton(
            variant: AppVariant.danger,
            onPressed: () => Navigator.of(context).pop(true),
            label: l10n.eliminar,
          ),
        ],
      ),
    );

    // Si el usuario confirma, se elimina la adopción
    if (confirm == true) {
      await ref.read(adopcionesProvider.notifier).removeAdopcion(idAnimal);

      // Se muestra un mensaje de confirmación
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.solicitudEliminada)));
    }
  }
}
