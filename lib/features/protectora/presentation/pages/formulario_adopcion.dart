import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/adopcion_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class FormularioAdopcion extends ConsumerStatefulWidget {
  final String seleccionado;

  const FormularioAdopcion({super.key, required this.seleccionado});

  @override
  ConsumerState<FormularioAdopcion> createState() => _FormularioAdopcionState();
}

class _FormularioAdopcionState extends ConsumerState<FormularioAdopcion> {
  final _nombreCtrl = TextEditingController();
  final _apellido1Ctrl = TextEditingController();
  final _apellido2Ctrl = TextEditingController();
  final _dniCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _direccionCtrl = TextEditingController();
  final _cpCtrl = TextEditingController();
  final _localidadCtrl = TextEditingController();
  final _provinciaCtrl = TextEditingController();

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _apellido1Ctrl.dispose();
    _apellido2Ctrl.dispose();
    _dniCtrl.dispose();
    _telefonoCtrl.dispose();
    _emailCtrl.dispose();
    _direccionCtrl.dispose();
    _cpCtrl.dispose();
    _localidadCtrl.dispose();
    _provinciaCtrl.dispose();
    super.dispose();
  }

  Future<void> _guardarAdopcion(animal) async {
    final nuevaAdopcion = Adopcion(
      idAnimal: int.parse(animal.idAnimal),
      nombreAnimal: animal.nombre,
      chip: animal.chip,
      usuarioNombre:
          "${_nombreCtrl.text} ${_apellido1Ctrl.text} ${_apellido2Ctrl.text}",
      usuarioEmail: _emailCtrl.text,
      usuarioTelefono: _telefonoCtrl.text,
      fechaAdopcion: DateTime.now(),
    );

    await ref.read(adopcionesProvider.notifier).addAdopcion(nuevaAdopcion);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Solicitud guardada correctamente')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final animalesAsync = ref.watch(animalesProvider);

    return Scaffold(
      appBar: customAppBar(context, "Formulario Adopción"),
      body: animalesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (animales) {
          final animal = animales.firstWhere(
            (animal) => animal.idAnimal == widget.seleccionado,
            orElse: () => throw Exception('Animal no encontrado'),
          );

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: ListView(
              children: [
                Image.network(animal.foto, width: 213, height: 257),
                const SizedBox(height: 20),

                // Datos del animal
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        AppInputText(
                          label: 'Nombre del animal',
                          seleccion: animal.nombre,
                          readOnly: true,
                        ),
                        const SizedBox(height: 12),
                        AppInputText(
                          label: 'Chip',
                          seleccion: animal.chip,
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Datos del adoptante
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        AppInputText(
                          label: 'Nombre del Adoptante',
                          controller: _nombreCtrl,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: AppInputText(
                                label: 'Primer apellido',
                                controller: _apellido1Ctrl,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppInputText(
                                label: 'Segundo apellido',
                                controller: _apellido2Ctrl,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: AppInputText(
                                label: 'DNI',
                                controller: _dniCtrl,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppInputText(
                                label: 'Teléfono',
                                controller: _telefonoCtrl,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        AppInputText(
                          label: 'Correo electrónico',
                          controller: _emailCtrl,
                        ),
                        const SizedBox(height: 12),
                        AppInputText(
                          label: 'Dirección',
                          controller: _direccionCtrl,
                        ),
                        const SizedBox(height: 12),
                        AppInputText(
                          label: 'Código postal',
                          controller: _cpCtrl,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: AppInputText(
                                label: 'Localidad',
                                controller: _localidadCtrl,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppInputText(
                                label: 'Provincia',
                                controller: _provinciaCtrl,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: AppButton(
                            label: "Enviar Solicitud",
                            onPressed: () => _guardarAdopcion(animal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
