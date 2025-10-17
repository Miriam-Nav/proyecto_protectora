import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/button_demo.dart';

//pagina que se muestra del boton del home
class PaginaDemostracion extends StatelessWidget {
  const PaginaDemostracion({super.key});

  @override
  Widget build(BuildContext context) {
    final brillo = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, //para que la card se vea arriba
          crossAxisAlignment: CrossAxisAlignment
              .start, //para que el texto se vea arriba a la izquierda
          children: [
            ////////////////////////////////////////
            ///
            Text('Protectora-Gestion', textDirection: TextDirection.ltr),
            Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  // Image.network(
                  //   'https://flutter.dev/images/catalog-widget-card.png',
                  //   fit: BoxFit.cover,
                  // ),
                  ListTile(
                    title: Text('Título de la Card'),
                    subtitle: Text('Subtítulo de la Card'),
                  ),
                ],
              ),
            ),

            ///
            /////////////////////////////////////////
            Text('Acciones', textDirection: TextDirection.ltr),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button_Paginademostracion(texto: "Registrar nuevo animal"),
                  
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button_Paginademostracion(texto: "Registrar nueva adopcion"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  button_Paginademostracion(texto: "Registrar visita veterinario"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
