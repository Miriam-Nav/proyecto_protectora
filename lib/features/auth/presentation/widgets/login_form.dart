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
    return Column(
      children: [
        MenuButton(
          label: "Inicio",
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
        ),
         MenuButton(
          label: "Animales",
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
        ),
         MenuButton(
          label: "Gestion",
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
        ),
         MenuButton(
          label: "Tareas",
          leadingIcon: Icons.star,
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
        ),
      ],
    );
  }
}
