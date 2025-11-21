import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/core/widgets/gradient_bg.dart';
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
    final l10n = AppLocalizations.of(context)!;
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
      SnackBar(content: Text(l10n.avisosolicitudguardada)),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final animalesAsync = ref.watch(animalesProvider);

    return Scaffold(
      appBar: customAppBar(context, l10n.tituloFormulario),
      body: animalesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (animales) {
          final animal = animales.firstWhere(
            (animal) => animal.idAnimal == widget.seleccionado,
            orElse: () => throw Exception(l10n.animalnoencontrado),
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
                          label: l10n.nombreAnimal,
                          seleccion: animal.nombre,
                          readOnly: true,
                        ),
                        const SizedBox(height: 12),
                        AppInputText(
                          label: l10n.chipAnimal,
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
                            label: l10n.nombreAdoptante,
                            controller: _nombreCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.comprobantenombreAdoptante;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: AppInputText(
                                  label: l10n.primerApellidoAdoptante,
                                  controller: _apellido1Ctrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.comprobantePrimerApellidoAdoptante;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: l10n.segundoApellidoAdoptante,
                                  controller: _apellido2Ctrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.comprobanteSegundoApellidoAdoptante;
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
                                  label: l10n.DNIAdoptante,
                                  controller: _dniCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.comprobanteDNIAdoptante;
                                    }

                                    final dniRegex = RegExp(r'^[0-9]{8}[A-Z]$');
                                    if (!dniRegex.hasMatch(value)) {
                                      return l10n.comprobanteFormatoDNIAdoptante;
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: l10n.telefonoAdoptante,
                                  controller: _telefonoCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.comprobantetelefonoAdoptante;
                                    }
                                    final numero = int.tryParse(value);
                                    if (numero == null) {
                                      return l10n.comprobanteFormatotelefonoAdoptante;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          AppInputText(
                            label: l10n.correoAdoptante,
                            controller: _emailCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.comporbanteCorreoAdoptante;
                              }
                              final emailRegex = RegExp(
                                r'^[^@]+@[^@]+\.[^@]+$',
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return l10n.comporbanteFormatoCorreoAdoptante;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AppInputText(
                            label: l10n.direccionAdoptante,
                            controller: _direccionCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.comprobanteDireccionAdoptante;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AppInputText(
                            label: l10n.codigopostalAdoptante,
                            controller: _cpCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.comprobanteCodigopostalAdoptante;
                              }
                              final numero = int.tryParse(value);
                              if (numero == null) {
                                return l10n.comprobanteFormatoCodigopostalAdoptante;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: AppInputText(
                                  label: l10n.localidadAdoptante,
                                  controller: _localidadCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.comprobantelocalidadAdoptante;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: l10n.provinciaAdoptante,
                                  controller: _provinciaCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.comprobanteProvinciaAdoptante;
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
                              label: l10n.enviarSolicitud,
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
