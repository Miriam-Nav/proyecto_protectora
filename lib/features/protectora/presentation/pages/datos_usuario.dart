import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/features/auth/data/models/user_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class DatosUsuario extends StatelessWidget {
  final User usuario;

  const DatosUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: customAppBar(context, l10n.datosUsuario),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),

        child: ListView(
          children: [
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                color: appPaletteOf(context).menuButton,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(usuario.image),
                        ),
                      ),
                      const SizedBox(height: 25),
                      AppInputText(
                        label: l10n.usuario,
                        seleccion: usuario.username,
                        readOnly: true,
                      ),
                      const SizedBox(height: 15),
                      AppInputText(
                        label: l10n.nombre,
                        seleccion: usuario.firstName,
                        readOnly: true,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: AppInputText(
                              label: l10n.apellido1,
                              seleccion: usuario.lastName,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppInputText(
                              label: l10n.apellido2,
                              seleccion: usuario.maidenName,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: AppInputText(
                              label: l10n.dni,
                              seleccion: usuario.id.toString(),
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppInputText(
                              label: l10n.telefono,
                              seleccion: usuario.phone,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      AppInputText(
                        label: l10n.correo,
                        seleccion: usuario.email,
                        readOnly: true,
                      ),
                      const SizedBox(height: 15),
                      AppInputText(
                        label: l10n.fechaNacimiento,
                        seleccion: usuario.birthDate,
                        readOnly: true,
                      ),
                      const SizedBox(height: 5),
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
