import 'package:flutter/material.dart';
import 'package:proyecto_protectora/catalog/widgets/button_demo.dart' show buttons_claro, buttons_oscuro;

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Botones"),
        // const Text("Tema Claro"),
        // Theme(data: ThemeData.light(), child: _buttonsRow()),
        buttons_claro(),
        buttons_oscuro()
      ],
    );
  }

  // static Widget _buttonsRow() {
  //   return Wrap(spacing: 10, runSpacing: 10, children: []);
  // }
}
