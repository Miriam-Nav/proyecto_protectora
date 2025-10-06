import 'package:flutter/material.dart';
import 'package:proyecto_protectora/catalog/demos/buttons_demo.dart';

class CatalogPages extends StatelessWidget {
  const CatalogPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogo')),
      body: ListView(children: const [ButtonsDemo()]),
    );
  }
}
