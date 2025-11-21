import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/gradient_bg.dart';
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
      appBar: customAppBar(context, l10n.gestionarAnimales),
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
                  return Text(l10n.noAnimalesRegistrados);
                }

                return DropdownButton<Animales>(
                  hint: Text(l10n.seleccionarAnimalEdicion),
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
            const SizedBox(height: 12),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppInputText(
                          label: l10n.nombreAnimal,
                          controller: controller.nombreCtrl,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputText(
                          label: l10n.sexoAnimal,
                          controller: controller.sexoCtrl,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputText(
                          label: l10n.fechaNacimientoAnimal,
                          controller: controller.fechaCtrl,
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
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputText(
                          label: l10n.tipoAnimal,
                          controller: controller.tipoCtrl,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: AppInputText(
                          label: l10n.esterelizadoAnimal,
                          controller: controller.esterilizadoCtrl,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputText(
                          label: l10n.chipAnimal,
                          controller: controller.chipCtrl,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  AppInputText(label: l10n.fotoAnimal, controller: controller.fotoCtrl),
                  const SizedBox(height: 12),
                  AppInputText(
                    label: l10n.descripcionAnimal,
                    controller: controller.descripcionCtrl,
                  ),

                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 12),
                      AppButton(
                        label: l10n.crearAnimal,
                        onPressed: () => controller.crear(ref, context),
                      ),
                      const SizedBox(width: 12),
                      AppButton(
                        label: l10n.guardarCambiosAnimal,
                        onPressed: () =>
                            controller.guardarCambios(ref, context),
                      ),
                      const SizedBox(width: 12),
                      AppButton(
                        label: l10n.eliminarAnimal,
                        onPressed: () async {
                          await controller.eliminar(ref, context);
                          setState(() {});
                        },
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
