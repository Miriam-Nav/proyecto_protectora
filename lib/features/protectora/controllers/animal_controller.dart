import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';

class AnimalController {
  final nombreCtrl = TextEditingController();
  final sexoCtrl = TextEditingController();
  final razaCtrl = TextEditingController();
  final tipoCtrl = TextEditingController();
  final fechaCtrl = TextEditingController();
  final esterilizadoCtrl = TextEditingController();
  final chipCtrl = TextEditingController();
  final descripcionCtrl = TextEditingController();
  final fotoCtrl = TextEditingController();

  Animales? seleccionado;

  void cargarAnimal(Animales animal) {
    nombreCtrl.text = animal.nombre;
    sexoCtrl.text = animal.sexo;
    razaCtrl.text = animal.raza;
    tipoCtrl.text = animal.tipo;
    fechaCtrl.text = animal.fNacimiento;
    esterilizadoCtrl.text = animal.estereilizado;
    chipCtrl.text = animal.chip;
    descripcionCtrl.text = animal.descripcion;
    fotoCtrl.text = animal.foto;
    seleccionado = animal;
  }

  void limpiar() {
    seleccionado = null;
    nombreCtrl.clear();
    sexoCtrl.clear();
    razaCtrl.clear();
    tipoCtrl.clear();
    fechaCtrl.clear();
    esterilizadoCtrl.clear();
    chipCtrl.clear();
    descripcionCtrl.clear();
    fotoCtrl.clear();
  }

  void dispose() {
    nombreCtrl.dispose();
    sexoCtrl.dispose();
    razaCtrl.dispose();
    tipoCtrl.dispose();
    fechaCtrl.dispose();
    esterilizadoCtrl.dispose();
    chipCtrl.dispose();
    descripcionCtrl.dispose();
    fotoCtrl.dispose();
  }

  Future<void> crear(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    await ref
        .read(animalesProvider.notifier)
        .addAnimal(
          nombreCtrl.text,
          sexoCtrl.text,
          razaCtrl.text,
          tipoCtrl.text,
          fechaCtrl.text,
          esterilizadoCtrl.text,
          chipCtrl.text,
          descripcionCtrl.text,
          fotoCtrl.text,
        );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.animalCreado)),
    );
    limpiar();
  }

  Future<void> guardarCambios(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    if (seleccionado == null) return;
    await ref
        .read(animalesProvider.notifier)
        .updateAnimal(
          Animales(
            idAnimal: seleccionado!.idAnimal,
            nombre: nombreCtrl.text,
            sexo: sexoCtrl.text,
            raza: razaCtrl.text,
            tipo: tipoCtrl.text,
            fNacimiento: fechaCtrl.text,
            estereilizado: esterilizadoCtrl.text,
            chip: chipCtrl.text,
            descripcion: descripcionCtrl.text,
            foto: fotoCtrl.text,
          ),
        );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.animalActualizado)),
    );
    limpiar();
  }

  Future<void> eliminar(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    if (seleccionado == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: appPaletteOf(context).background,
        title:  Text(l10n.confirmarEliminacion),
        content: Text(
          '${l10n.preguntarConfirmarEliminacion} ${seleccionado!.nombre}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancelar),
          ),
          AppButton(
            variant: AppButtonVariant.danger,
            onPressed: () => Navigator.of(context).pop(true),
            label: l10n.eliminar,
          ),
        ],
      ),
    );

    if (confirm == true) {
      await ref
          .read(animalesProvider.notifier)
          .removeAnimal(seleccionado!.idAnimal);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.animalEliminadoCorrectamente)),
      );
      limpiar();
    }
  }
}
