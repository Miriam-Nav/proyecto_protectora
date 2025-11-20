import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/core/widgets/gradient_bg.dart';
import 'package:proyecto_protectora/features/auth/data/models/user_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

class DatosUsuario extends StatelessWidget {
  final User usuario;

  const DatosUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Datos de Usuario"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(usuario.image),
                    ),
                  ),
                  const SizedBox(height: 25),
                  AppInputText(
                    label: 'Usuario',
                    seleccion: usuario.username,
                    readOnly: true,
                  ),
                  const SizedBox(height: 15),
                  AppInputText(
                    label: 'Nombre',
                    seleccion: usuario.firstName,
                    readOnly: true,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: AppInputText(
                          label: 'Primer apellido',
                          seleccion: usuario.lastName,
                          readOnly: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputText(
                          label: 'Segundo apellido',
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
                          label: 'DNI',
                          seleccion: usuario.id.toString(),
                          readOnly: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputText(
                          label: 'Número de teléfono',
                          seleccion: usuario.phone,
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  AppInputText(
                    label: 'Correo electrónico',
                    seleccion: usuario.email,
                    readOnly: true,
                  ),
                  const SizedBox(height: 15),
                  AppInputText(
                    label: 'Fecha de nacimiento',
                    seleccion: usuario.birthDate,
                    readOnly: true,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(content: Text('Datos de usuario mostrados')),
        //     );
        //   },
        //   icon: const Icon(Icons.save),
        //   label: const Text('Guardar'),
        // ),
      ),
    );
  }
}
