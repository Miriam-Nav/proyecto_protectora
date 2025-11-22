import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/adopcion_provider.dart';

class AdopcionController {
  // Controladores para los datos del adoptante
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

  void cargarAnimal(Animales animal) {
    animalSeleccionado = animal;
  }

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

  Future<void> crearAdopcion(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;

    if (animalSeleccionado == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.noAnimalSelect)));
      return;
    }

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

    await ref.read(adopcionesProvider.notifier).addAdopcion(adopcion);
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.solicitudCreada)));

    limpiar();
  }

  Future<void> eliminarAdopcion(
    WidgetRef ref,
    BuildContext context,
    String idAnimal,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.confirmarEliminacion),
        content: Text(l10n.preguntEliAdop),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancelar),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: appPaletteOf(context).danger,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.eliminar),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await ref.read(adopcionesProvider.notifier).removeAdopcion(idAnimal);
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.solicitudEliminada)));
    }
  }
}
