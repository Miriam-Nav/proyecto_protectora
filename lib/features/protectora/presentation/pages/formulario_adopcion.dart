import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/features/auth/controllers/auth_controller.dart';
import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/datos_usuario.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/adopcion_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class FormularioAdopcion extends ConsumerStatefulWidget {
  final String seleccionado;

  const FormularioAdopcion({
    super.key,
    WidgetRef? ref,
    required this.seleccionado,
  });

  @override
  ConsumerState<FormularioAdopcion> createState() => _FormularioAdopcionState();
}

class _FormularioAdopcionState extends ConsumerState<FormularioAdopcion> {
  // Clave global para validar el formulario
  final _formKey = GlobalKey<FormState>();
  // Controladores de texto para cada campo del formulario
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
  // late final usuario = ref.watch(authControllerProvider).value;

  @override
  // Liberar memoria de los controladores
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

  late final usuario = ref.read(authControllerProvider).value;
  // if (usuario != null) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(

  //     ),
  //   );
  // } else {
  //   // Mensaje de usuario no loggeado
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text(l10n.noLoggin)));
  // }

  // Método que guarda la solicitud de adopción
  Future<void> _guardarAdopcion(Animales animal) async {
    final l10n = AppLocalizations.of(context)!;
    // Se construye un objeto Adopcion
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

    // Se añade la adopción al provider
    await ref.read(adopcionesProvider.notifier).addAdopcion(nuevaAdopcion);

    // Si el widget sigue montado, se muestra un aviso y se cierra la pantalla
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.avisoSolicitudGuardada)));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Obtener la lista de animales
    final animalesAsync = ref.watch(animalesProvider);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: customAppBar(context, l10n.tituloFormulario),
      body: animalesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (animales) {
          // Busca el animal seleccionado por id
          final animal = animales.firstWhere(
            (animal) => animal.idAnimal == widget.seleccionado,
            orElse: () => throw Exception(l10n.animalNoEncontrado),
          );

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: ListView(
              children: [
                // Imagen del animal
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

                // Tarjeta con datos del animal
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
                        // Nombre
                        AppInputText(
                          label: l10n.nombre,
                          seleccion: animal.nombre,
                          readOnly: true,
                        ),
                        const SizedBox(height: 12),
                        // Chip
                        AppInputText(
                          label: l10n.chipAnimal,
                          seleccion: animal.chip ?? "-",
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Tarjeta con formulario de datos del adoptante
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
                          // Nombre adoptante
                          AppInputText(
                            label: l10n.nombreAdoptante,
                            seleccion: usuario?.username,
                            // controller: _nombreCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.nombreObligatorio;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          // Apellidos en dos columnas
                          Row(
                            children: [
                              Expanded(
                                child: AppInputText(
                                  label: l10n.apellido1,
                                  seleccion: usuario?.maidenName,
                                  // controller: _apellido1Ctrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.obligatorioApellido1;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: l10n.apellido2,
                                  seleccion: usuario?.lastName,
                                  // controller: _apellido2Ctrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.obligatorioApellido2;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // DNI y teléfono
                          Row(
                            children: [
                              Expanded(
                                child: AppInputText(
                                  label: l10n.dni,
                                  controller: _dniCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.obligatorioDni;
                                    }
                                    final dniRegex = RegExp(r'^[0-9]{8}[A-Z]$');
                                    if (!dniRegex.hasMatch(value)) {
                                      return l10n.formatoDni;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: l10n.telefono,
                                  seleccion: usuario?.phone,
                                  // controller: _telefonoCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.obligatorioTelefono;
                                    }
                                    final numero = int.tryParse(value);
                                    if (numero == null) {
                                      return l10n.formatoNum;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Correo electrónico
                          AppInputText(
                            label: l10n.correo,
                            seleccion: usuario?.email,
                            // controller: _emailCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.obligatorioCorreo;
                              }
                              final emailRegex = RegExp(
                                r'^[^@]+@[^@]+\.[^@]+$',
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return l10n.formatoCorreo;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          // Dirección
                          AppInputText(
                            label: l10n.direccion,
                            controller: _direccionCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.obligatorioDireccion;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          // Código postal
                          AppInputText(
                            label: l10n.cp,
                            controller: _cpCtrl,
                            color: appPaletteOf(context).cardGreen,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.obligatorioCp;
                              }
                              final numero = int.tryParse(value);
                              if (numero == null) {
                                return l10n.formatoNum;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          // Localidad y provincia
                          Row(
                            children: [
                              Expanded(
                                child: AppInputText(
                                  label: l10n.localidad,
                                  controller: _localidadCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.obligLocalidad;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppInputText(
                                  label: l10n.provincia,
                                  controller: _provinciaCtrl,
                                  color: appPaletteOf(context).cardGreen,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.obligProvincia;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Botón para enviar la solicitud
                          Center(
                            child: AppButton(
                              label: l10n.enviarSolicitud,
                              txColor: appPaletteOf(context).onSecondary,
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
