import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/app/theme/app_variants.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/controllers/animal_controller.dart';
import 'package:proyecto_protectora/features/protectora/controllers/animal_form_controller.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class GestionAnimal extends ConsumerStatefulWidget {
  const GestionAnimal({super.key});

  @override
  ConsumerState<GestionAnimal> createState() => _CrearAnimalState();
}

class _CrearAnimalState extends ConsumerState<GestionAnimal> {
  final _formKey = GlobalKey<FormState>();

  // Controlador que gestiona los campos y lógica de CRUD
  late final AnimalController controller;
  late final AnimalFormControllers animalFormController;

  @override
  void initState() {
    super.initState();
    controller = AnimalController();
    animalFormController = AnimalFormControllers();
  }

  @override
  void dispose() {
    controller.dispose();
    animalFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Provider que devuelve la lista de animales
    final animalesAsync = ref.watch(animalesProvider);

    String sexoLabel(Sexo sexo) {
      switch (sexo) {
        case Sexo.macho:
          return l10n.macho;
        case Sexo.hembra:
          return l10n.hembra;
      }
    }

    String tipoLabel(TipoAnimal tipo) {
      switch (tipo) {
        case TipoAnimal.perro:
          return l10n.perro;
        case TipoAnimal.gato:
          return l10n.gato;
        case TipoAnimal.otro:
          return l10n.otro;
      }
    }

    return Scaffold(
      appBar: customAppBar(context, l10n.gestionarAnimales),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 14),

            animalesAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Error: $e'),
              data: (animales) {
                if (animales.isEmpty) {
                  return Text(l10n.noAnimalesRegistrados);
                }
                // Dropdown para seleccionar un animal y editarlo
                return DropdownButton<Animales>(
                  hint: Text(l10n.selecEdicion),
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

            // Card con el formulario de creación/edición
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
                      Row(
                        children: [
                          // Nombre
                          Expanded(
                            child: AppInputText(
                              focusNode: animalFormController.nombreFocus,
                              label: l10n.nombre,
                              controller: controller.nombreCtrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  animalFormController.nombreFocus
                                      .requestFocus();
                                  return l10n.nombreObligatorio;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Sexo
                          Expanded(
                            child: AppInputSelect<Sexo>(
                              focusNode: animalFormController.sexoFocus,
                              label: l10n.sexoAnimal,
                              value: controller.sexo,
                              items: Sexo.values,
                              itemLabel: sexoLabel,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.sexo = value;
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  animalFormController.sexoFocus.requestFocus();
                                  return l10n.selecSexo;
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
                          // Raza
                          Expanded(
                            child: AppInputText(
                              focusNode: animalFormController.razaFocus,
                              label: l10n.razaAnimal,
                              controller: controller.razaCtrl,

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  animalFormController.razaFocus.requestFocus();
                                  return l10n.razaOblig;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Tipo
                          Expanded(
                            child: AppInputSelect<TipoAnimal>(
                              focusNode: animalFormController.tipoFocus,
                              label: l10n.tipoAnimal,
                              value: controller.tipo,
                              items: TipoAnimal.values,
                              itemLabel: tipoLabel,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.tipo = value;
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  animalFormController.tipoFocus.requestFocus();
                                  return l10n.tipoOblig;
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
                          // Fecha con date picker
                          Expanded(
                            child: TextFormField(
                              controller: controller.fechaCtrl,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: l10n.fechaNacimiento,
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
                                  controller.fechaNacimiento = picked;
                                  controller.fechaCtrl.text = picked
                                      .toIso8601String()
                                      .split('T')
                                      .first;
                                }
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  animalFormController.fechaFocus
                                      .requestFocus();
                                  return l10n.fechaOblig;
                                }
                                return null;
                              },
                            ),
                          ),

                          const SizedBox(width: 12),
                          // Esterilizado como checkbox
                          Expanded(
                            child: CheckboxListTile(
                              title: Text(l10n.esterelizadoAnimal),
                              value: controller.esterilizado,
                              onChanged: (checked) {
                                controller.esterilizado = checked ?? false;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                      // Chip
                      AppInputText(
                        focusNode: animalFormController.chipFocus,
                        label: l10n.chipAnimal,
                        controller: controller.chipCtrl,
                        validator: (value) {
                          final animales =
                              ref.watch(animalesProvider).value ?? [];
                          final error = controller.validarChip(
                            value,
                            animales,
                            l10n,
                          );
                          if (error != null) {
                            animalFormController.chipFocus.requestFocus();
                          }
                          return error;
                        },
                      ),

                      const SizedBox(height: 12),
                      // Foto
                      AppInputText(
                        focusNode: animalFormController.fotoFocus,
                        label: l10n.fotoAnimal,
                        controller: controller.fotoCtrl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            animalFormController.fotoFocus.requestFocus();
                            return l10n.fotoOblig;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      // Descripción
                      AppInputText(
                        focusNode: animalFormController.descripcionFocus,
                        label: l10n.descripcionAnimal,
                        controller: controller.descripcionCtrl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            animalFormController.descripcionFocus
                                .requestFocus();
                            return l10n.descOblig;
                          }
                          if (value.length > 50) {
                            animalFormController.descripcionFocus
                                .requestFocus();
                            return l10n.descLong;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Botones
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          // Crear
                          SizedBox(
                            width: 100,
                            child: AppButton(
                              label: l10n.crearAnimal,
                              txColor: appPaletteOf(context).onSecondary,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.crear(ref, context);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Guardar
                          SizedBox(
                            width: 100,
                            child: AppButton(
                              label: l10n.guardarCambios,
                              txColor: appPaletteOf(context).onSecondary,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.guardarCambios(ref, context);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Eliminar
                          SizedBox(
                            width: 100,
                            child: AppButton(
                              label: l10n.eliminar,
                              onPressed: () async {
                                await controller.eliminar(ref, context);
                                setState(() {});
                              },
                              variant: AppVariant.danger,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
