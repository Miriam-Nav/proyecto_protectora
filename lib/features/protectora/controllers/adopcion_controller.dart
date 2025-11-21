import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    if (animalSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay animal seleccionado')),
      );
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

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Solicitud de adopción creada correctamente'),
      ),
    );

    limpiar();
  }

  Future<void> eliminarAdopcion(
    WidgetRef ref,
    BuildContext context,
    String idAnimal,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: const Text(
          '¿Estás seguro de que quieres eliminar esta adopción?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await ref.read(adopcionesProvider.notifier).removeAdopcion(idAnimal);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Adopción eliminada correctamente')),
      );
    }
  }
}
