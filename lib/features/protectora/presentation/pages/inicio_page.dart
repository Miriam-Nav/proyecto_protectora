import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_card.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/login_page.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/drawer_page.dart';

//pagina que se muestra del boton del home
class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(l10n.appTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),

      drawer: ProtectoraDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Protectora-Gestion',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.left,
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: AppNotiCard(
                    title: "Visita Veterinario",
                    text: "Tienes 2 visitas al veterniario esta semana.",
                    badgeText: "Revisar",
                    variant: AppCardVariant.cardBlue,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Acciones',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                AppRoundedActionButton(
                  leadingIcon: Icons.pets,
                  label: 'Registrar Nuevo Animal',
                  onPressed: () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
                ),

                AppRoundedActionButton(
                  leadingIcon: Icons.favorite_border,
                  label: 'Registrar Nueva Adopción',
                  onPressed: () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
                ),

                AppRoundedActionButton(
                  leadingIcon: Icons.medical_services_outlined,
                  label: 'Registrar Visita Veterinario',
                  onPressed: () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
                ),
              ],
            ),

            SizedBox(height: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Actividad reciente',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                AppInfoCard(
                  title: "hola",
                  subtitle: "prueba",
                  badgeText: "notificacion",
                  variant: AppCardVariant.cardBlue,
                ),

                AppInfoCard(
                  title: "hola",
                  subtitle: "prueba",
                  badgeText: "notificacion",
                  variant: AppCardVariant.cardGreen,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
