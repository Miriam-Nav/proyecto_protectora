import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';

class AnimalController {
  final nombreCtrl = TextEditingController();
  final sexoCtrl = TextEditingController(); // "Macho" / "Hembra"
  final razaCtrl = TextEditingController();
  final tipoCtrl = TextEditingController(); // "Perro" / "Gato"
  final fechaCtrl = TextEditingController(); // "2020-01-15"
  final esterilizadoCtrl = TextEditingController(); // "Sí" / "No"
  final chipCtrl = TextEditingController();
  final descripcionCtrl = TextEditingController();
  final fotoCtrl = TextEditingController();

  Animales? seleccionado;

  void cargarAnimal(Animales animal) {
    nombreCtrl.text = animal.nombre;
    sexoCtrl.text = animal.sexo.name; // enum → string
    razaCtrl.text = animal.raza;
    tipoCtrl.text = animal.tipo.name; // enum → string
    fechaCtrl.text = animal.fNacimiento.toIso8601String();
    esterilizadoCtrl.text = animal.esterilizado ? "Sí" : "No";
    chipCtrl.text = animal.chip ?? "";
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

  /// Crear un nuevo animal
  Future<void> crear(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    await ref
        .read(animalesProvider.notifier)
        .addAnimal(
          nombre: nombreCtrl.text,
          sexo: _parseSexo(sexoCtrl.text),
          raza: razaCtrl.text,
          tipo: _parseTipo(tipoCtrl.text),
          fNacimiento: DateTime.parse(fechaCtrl.text),
          esterilizado: esterilizadoCtrl.text.toLowerCase() == "sí",
          chip: chipCtrl.text.isEmpty ? null : chipCtrl.text,
          descripcion: descripcionCtrl.text,
          foto: fotoCtrl.text,
        );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.animalCreado)));
    limpiar();
  }

  Future<void> guardarCambios(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    if (seleccionado == null) return;

    final actualizado = seleccionado!.copyWith(
      nombre: nombreCtrl.text,
      sexo: _parseSexo(sexoCtrl.text),
      raza: razaCtrl.text,
      tipo: _parseTipo(tipoCtrl.text),
      fNacimiento: DateTime.parse(fechaCtrl.text),
      esterilizado: esterilizadoCtrl.text.toLowerCase() == "sí",
      chip: chipCtrl.text.isEmpty ? null : chipCtrl.text,
      descripcion: descripcionCtrl.text,
      foto: fotoCtrl.text,
    );

    await ref.read(animalesProvider.notifier).updateAnimal(actualizado);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.animalActualizado)));
    limpiar();
  }

  /// Eliminar animal seleccionado
  Future<void> eliminar(WidgetRef ref, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    if (seleccionado == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: appPaletteOf(context).background,
        title: Text(l10n.confirmarEliminacion),
        content: Text(
          '${l10n.preguntarConfirmarEliminacion} ${seleccionado!.nombre}?',
        ),
        actions: [
          AppButton(
            onPressed: () => Navigator.of(context).pop(false),
            label: l10n.cancelar,
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

  // --- Helpers para convertir texto a enums ---
  Sexo _parseSexo(String value) {
    return value.toLowerCase().startsWith("h") ? Sexo.hembra : Sexo.macho;
  }

  TipoAnimal _parseTipo(String value) {
    switch (value.toLowerCase()) {
      case "perro":
        return TipoAnimal.perro;
      case "gato":
        return TipoAnimal.gato;
      default:
        return TipoAnimal.otro;
    }
  }
}
