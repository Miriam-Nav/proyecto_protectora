import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
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
  final _formKey = GlobalKey<FormState>();

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
      idAnimal: animal.idAnimal,
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
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      width: 300,
                      height: 250,
                      child: Image.network(animal.foto, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Datos del animal
                Card(
                  color: appPaletteOf(context).menuButton,
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
                        // AppInputText(
                        //   label: 'Chip',
                        //   seleccion: animal.chip ?? "Sin Chip",
                        //   readOnly: true,
                        // ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Datos del adoptante
                Card(
                  color: appPaletteOf(context).menuButton,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppInputText(
                            label: 'Nombre del Adoptante',
                            controller: _nombreCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El Nombre es obligatorio';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: AppInputText(
                                  label: 'Primer apellido',
                                  controller: _apellido1Ctrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'El Primer Apellido es obligatorio';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: 'Segundo apellido',
                                  controller: _apellido2Ctrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'El Segundo Apellido es obligatorio';
                                    }
                                    return null;
                                  },
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
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'El DNI es obligatorio';
                                    }

                                    final dniRegex = RegExp(r'^[0-9]{8}[A-Z]$');
                                    if (!dniRegex.hasMatch(value)) {
                                      return 'Formato de DNI inválido (12345678A)';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: 'Teléfono',
                                  controller: _telefonoCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'El Teléfono es obligatorio';
                                    }
                                    final numero = int.tryParse(value);
                                    if (numero == null) {
                                      return 'Se esperaba un valor numérico';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          AppInputText(
                            label: 'Correo electrónico',
                            controller: _emailCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El correo es obligatorio';
                              }
                              final emailRegex = RegExp(
                                r'^[^@]+@[^@]+\.[^@]+$',
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return 'Formato de correo no válido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AppInputText(
                            label: 'Dirección',
                            controller: _direccionCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'La Dirección es obligatoria';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AppInputText(
                            label: 'Código postal',
                            controller: _cpCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El CP es obligatorio';
                              }
                              final numero = int.tryParse(value);
                              if (numero == null) {
                                return 'Se esperaba un valor numérico';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: AppInputText(
                                  label: 'Localidad',
                                  controller: _localidadCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'La Localidad es obligatoria';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: 'Provincia',
                                  controller: _provinciaCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'La Provincia es obligatoria';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: AppButton(
                              label: "Enviar Solicitud",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _guardarAdopcion(animal);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
