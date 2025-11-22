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
                          Expanded(
                            child: AppInputText(
                              label: l10n.nombre,
                              controller: controller.nombreCtrl,
                              validator: (v) => v == null || v.isEmpty
                                  ? l10n.nombreObligatorio
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppInputSelect<Sexo>(
                              label: l10n.sexoAnimal,
                              value: controller.sexo,
                              items: Sexo.values,
                              itemLabel: sexoLabel,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.sexo = value;
                                }
                              },
                              validator: (value) =>
                                  value == null ? l10n.selecSexo : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: AppInputText(
                              label: l10n.razaAnimal,
                              controller: controller.razaCtrl,
                              validator: (v) => v == null || v.isEmpty
                                  ? l10n.razaOblig
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppInputSelect<TipoAnimal>(
                              label: l10n.tipoAnimal,
                              value: controller.tipo,
                              items: TipoAnimal.values,
                              itemLabel: tipoLabel,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.tipo = value;
                                }
                              },
                              validator: (value) =>
                                  value == null ? l10n.tipoOblig : null,
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
                              validator: (v) => v == null || v.isEmpty
                                  ? l10n.fechaOblig
                                  : null,
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
                      AppInputText(
                        label: l10n.chipAnimal,
                        controller: controller.chipCtrl,
                        validator: (value) {
                          final animales =
                              ref.watch(animalesProvider).value ?? [];
                          return controller.validarChip(value, animales, l10n);
                        },
                      ),

                      const SizedBox(height: 12),
                      AppInputText(
                        label: l10n.fotoAnimal,
                        controller: controller.fotoCtrl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.fotoOblig;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      AppInputText(
                        label: l10n.descripcionAnimal,
                        controller: controller.descripcionCtrl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.descOblig;
                          }
                          if (value.length > 50) {
                            return l10n.descLong;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          SizedBox(
                            width: 100,
                            child: AppButton(
                              label: l10n.crearAnimal,
                              foregroundColorOverride: appPaletteOf(
                                context,
                              ).onSecondary,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.crear(ref, context);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 100,
                            child: AppButton(
                              label: l10n.guardarCambios,
                              foregroundColorOverride: appPaletteOf(
                                context,
                              ).onSecondary,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.guardarCambios(ref, context);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 100,
                            child: AppButton(
                              label: l10n.eliminar,
                              onPressed: () async {
                                await controller.eliminar(ref, context);
                                setState(() {});
                              },
                              variant: AppButtonVariant.danger,
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
