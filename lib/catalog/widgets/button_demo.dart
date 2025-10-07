import 'package:flutter/material.dart';

class buttons_claro extends StatelessWidget {
  const buttons_claro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Presionar', textDirection: TextDirection.ltr),
        ),
      ],
    );
  }
}

class buttons_oscuro extends StatelessWidget {
  const buttons_oscuro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Presionar1', textDirection: TextDirection.ltr),
        ),
      ],
    );
  }
}
