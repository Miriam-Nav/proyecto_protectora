import 'package:flutter/material.dart';
import 'package:proyecto_protectora/catalog/demos/buttons_demo.dart';


class CatalogPages extends StatelessWidget {
  const CatalogPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Flutter demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('catalogo'),
        ),
        body: Center(child: ButtonsDemo(),)
      )
    );
  }
}
