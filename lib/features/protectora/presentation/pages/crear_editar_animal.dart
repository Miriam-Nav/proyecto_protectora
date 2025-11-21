import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/controllers/animal_controller.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class CrearAnimal extends ConsumerStatefulWidget {
  const CrearAnimal({super.key});

  @override
  ConsumerState<CrearAnimal> createState() => _CrearAnimalState();
}

class _CrearAnimalState extends ConsumerState<CrearAnimal> {
  final _formKey = GlobalKey<FormState>();

  late final AnimalController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimalController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final animalesAsync = ref.watch(animalesProvider);

    return Scaffold(
      appBar: customAppBar(context, "Gestional Animales"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: ListView(
          children: [
            // Text(
            //   'Protectora-Adopción',
            //   style: Theme.of(context).textTheme.headlineSmall,
            // ),
            const SizedBox(height: 14),

            animalesAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Error: $e'),
              data: (animales) {
                if (animales.isEmpty) {
                  return const Text('No hay animales registrados');
                }

                return DropdownButton<Animales>(
                  hint: const Text('Selecciona un animal para editar'),
                  value: controller.seleccionado,
                  items: animales.map((animal) {
                    return DropdownMenuItem(
                      value: animal,
                      child: Text('${animal.nombre} (${animal.chip})'),
                    );
                  }).toList(),
                  onChanged: (animal) {
                    if (animal != null) {
                      setState(() {
                        controller.cargarAnimal(animal);
                      });
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppInputText(
                          label: 'Nombre',
                          controller: controller.nombreCtrl,
                          validator: (v) => v == null || v.isEmpty
                              ? 'Nombre obligatorio'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputSelect<Sexo>(
                          label: 'Sexo',
                          value: controller.seleccionado?.sexo,
                          items: Sexo.values,
                          itemLabel: sexoLabel,
                          onChanged: (value) {
                            if (value != null) {
                              controller.sexoCtrl.text = value.name;
                            }
                          },
                          validator: (value) =>
                              value == null ? 'Selecciona sexo' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: AppInputText(
                          label: 'Raza',
                          controller: controller.razaCtrl,
                          validator: (v) => v == null || v.isEmpty
                              ? 'Raza obligatoria'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputSelect<TipoAnimal>(
                          label: 'Tipo',
                          value: controller.seleccionado?.tipo,
                          items: TipoAnimal.values,
                          itemLabel: tipoLabel,
                          onChanged: (value) {
                            if (value != null) {
                              controller.tipoCtrl.text = value.name;
                            }
                          },
                          validator: (value) =>
                              value == null ? 'Selecciona tipo' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      // Fecha con date picker
                      Expanded(
                        child: TextFormField(
                          controller: controller.fechaCtrl,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Fecha nacimiento',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: appPaletteOf(context).primary,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: appPaletteOf(context).secondary,
                                width: 2,
                              ),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: appPaletteOf(context).secondary,
                            ),
                          ),
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) {
                              controller.fechaCtrl.text = picked
                                  .toIso8601String()
                                  .split('T')
                                  .first;
                            }
                          },
                          validator: (v) => v == null || v.isEmpty
                              ? 'Fecha obligatoria'
                              : null,
                        ),
                      ),

                      const SizedBox(width: 12),
                      // Esterilizado como checkbox
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text('Esterilizado'),
                          value:
                              controller.esterilizadoCtrl.text.toLowerCase() ==
                              "sí",
                          onChanged: (checked) {
                            controller.esterilizadoCtrl.text = checked == true
                                ? "Sí"
                                : "No";
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  AppInputText(label: 'Chip', controller: controller.chipCtrl),
                  const SizedBox(height: 12),
                  AppInputText(
                    label: 'Foto',
                    controller: controller.fotoCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'La foto es obligatoria';
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  AppInputText(
                    label: 'Descripción Breve',
                    controller: controller.descripcionCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'La descripción es obligatoria';
                      }
                      if (value.length > 50) {
                        return 'La descripción no puede superar los 50 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        label: "Crear Animal",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.crear(ref, context);
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      AppButton(
                        label: "Guardar Cambios",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.guardarCambios(ref, context);
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      AppButton(
                        label: "Eliminar Animal",
                        onPressed: () async {
                          await controller.eliminar(ref, context);
                          setState(() {});
                        },
                        variant: AppButtonVariant.danger,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
