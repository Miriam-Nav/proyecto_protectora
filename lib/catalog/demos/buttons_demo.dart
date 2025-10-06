import 'package:flutter/material.dart';


class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Botones"),
        const Text("Tema Claro"),
        Theme(data: ThemeData.light(), child: _buttonsRow()),
      ],
    );
  }

  static Widget _buttonsRow() {
    return Wrap(spacing: 10, runSpacing: 10, children: []);
  }
}
