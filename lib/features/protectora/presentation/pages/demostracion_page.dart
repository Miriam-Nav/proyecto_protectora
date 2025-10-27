import 'package:flutter/material.dart';
import 'package:proyecto_protectora/catalog/demos/buttons_demo.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_card.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/login_page.dart'
    show LoginScreen;
import 'package:proyecto_protectora/features/auth/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/login_form.dart';

//pagina que se muestra del boton del home
class PaginaDemostracion extends StatelessWidget {
  const PaginaDemostracion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('Inicio'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      drawer: ProtectoraDrawer(),
      bottomNavigationBar:
          Menu_buttons(), //posible solucion para el scroll de pantalla para los botones de la barra de navegacion
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
            Padding(
              padding: EdgeInsets.all(5),
              child: AppInfoCard(
                title: "hola",
                subtitle: "prueba",
                badgeText: "notificacion",
                variant: AppCardVariant.cardBlue,
              ),
            ),

            ///
            /////////////////////////////////////////
            Text('Acciones', textDirection: TextDirection.ltr),

            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
              child: AppRoundedActionButton(
                label: "Registrar nuevo animal",
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
              child: AppRoundedActionButton(
                label: "Registrar nueva adopcion",
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
              child: AppRoundedActionButton(
                label: "Registrar visita veterinario",
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
              ),
            ),
            Text('Actividad reciente', textDirection: TextDirection.ltr),
            Padding(
              padding: EdgeInsets.all(5),
              child: AppInfoCard(
                title: "hola",
                subtitle: "prueba",
                badgeText: "notificacion",
                variant: AppCardVariant.cardBlue,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: AppInfoCard(
                title: "hola",
                subtitle: "prueba",
                badgeText: "notificacion",
                variant: AppCardVariant.cardGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
