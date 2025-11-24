import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/app/theme/app_variants.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';

class AnimalController {
  final nombreCtrl = TextEditingController();
  Sexo? sexo;
  final razaCtrl = TextEditingController();
  TipoAnimal? tipo;
  final fechaCtrl = TextEditingController(); // Solo para mostrar la fecha
  DateTime? fechaNacimiento;
  bool esterilizado = false;
  final chipCtrl = TextEditingController();
  final descripcionCtrl = TextEditingController();
  final fotoCtrl = TextEditingController();

  Animales? seleccionado;

  // Cargar los datos de un animal en los controladores
  void cargarAnimal(Animales animal) {
    nombreCtrl.text = animal.nombre;
    sexo = animal.sexo;
    razaCtrl.text = animal.raza;
    tipo = animal.tipo;
    fechaNacimiento = animal.fNacimiento;
    fechaCtrl.text = animal.fNacimiento.toIso8601String().split('T').first;
    esterilizado = animal.esterilizado;
    chipCtrl.text = animal.chip ?? "";
    descripcionCtrl.text = animal.descripcion;
    fotoCtrl.text = animal.foto;
    seleccionado = animal;
  }

  // Limpiar todos los campos 
  void limpiar() {
    seleccionado = null;
    nombreCtrl.clear();
    sexo = null;
    razaCtrl.clear();
    tipo = null;
    fechaCtrl.clear();
    fechaNacimiento = null;
    esterilizado = false;
    chipCtrl.clear();
    descripcionCtrl.clear();
    fotoCtrl.clear();
  }

  // Liberar los recursos de los controladores 
  void dispose() {
    nombreCtrl.dispose();
    razaCtrl.dispose();
    fechaCtrl.dispose();
    chipCtrl.dispose();
    descripcionCtrl.dispose();
    fotoCtrl.dispose();
  }

  /// Crear un nuevo animal
  Future<void> crear(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    // Se añade el animal al provider con los datos del formulario
    await ref
        .read(animalesProvider.notifier)
        .addAnimal(
          nombre: nombreCtrl.text,
          sexo: sexo!,
          raza: razaCtrl.text,
          tipo: tipo!,
          fNacimiento: fechaNacimiento!,
          esterilizado: esterilizado,
          chip: chipCtrl.text.isEmpty ? null : chipCtrl.text,
          descripcion: descripcionCtrl.text,
          foto: fotoCtrl.text,
        );
    // Se muestra un mensaje de confirmación
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.animalCreado)));
    limpiar();
  }

  // Guardar cambios en un animal ya existente
  Future<void> guardarCambios(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    if (seleccionado == null) return;

    // Se crea una copia del animal con los valores actualizados
    final actualizado = seleccionado!.copyWith(
      nombre: nombreCtrl.text,
      sexo: sexo,
      raza: razaCtrl.text,
      tipo: tipo,
      fNacimiento: fechaNacimiento!,
      esterilizado: esterilizado,
      chip: chipCtrl.text.isEmpty ? null : chipCtrl.text,
      descripcion: descripcionCtrl.text,
      foto: fotoCtrl.text,
    );

    // Se actualiza el animal en el provider
    await ref.read(animalesProvider.notifier).updateAnimal(actualizado);
    // Se muestra un mensaje de confirmación
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.animalActualizado)));
    limpiar();
  }

  /// Eliminar el animal seleccionado
  Future<void> eliminar(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    if (seleccionado == null) return;

    // Se muestra un diálogo de confirmación
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: appPaletteOf(context).background,
        title: Text(l10n.confirmarEliminacion),
        content: Text(l10n.preguntaEliminacion(seleccionado!.nombre)),
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

    // Si se confirma, se elimina el animal
    if (confirm == true) {
      await ref
          .read(animalesProvider.notifier)
          .removeAnimal(seleccionado!.idAnimal);
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.animalEliminado)));
      limpiar();
    }
  }

  // Validar que el chip no esté duplicado en la lista de animales
  String? validarChip(
    String? chip,
    List<Animales> animales,
    AppLocalizations l10n,
  ) {
    final existeChip = animales.any((a) => a.chip == chip);
    if (existeChip) return l10n.chipDuplicado;
    return null;
  }
}
