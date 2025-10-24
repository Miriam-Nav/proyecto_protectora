import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/login_page.dart';

class Menu_buttons extends StatelessWidget {
  // final Widget? pantallaDestino;

  // final dynamic texto;

  const Menu_buttons({
    super.key,
    // this.pantallaDestino,
    // required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppButton(
          label: "Inicio",
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
        ),
         AppButton(
          label: "Animales",
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
        ),
         AppButton(
          label: "Gestion",
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
        ),
         AppButton(
          label: "Tareas",
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
        ),
      ],
    );
  }
}
