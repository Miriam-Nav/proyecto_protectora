import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
// import 'package:proyecto_protectora/features/preferences/controllers/preferences_controller.dart';
import 'package:proyecto_protectora/catalog/catalog_pages.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/login_page.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';

//pagina principal
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    // final prefsAsync = ref.watch(preferencesProvider);

    // // obtiene el valor actual del modo oscuro desde Riverpod
    // final modoOscuro = prefsAsync.maybeWhen(
    //   data: (p) => p.darkmode,
    //   orElse: () => false,
    // );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: ListView(
        children: [
          const SizedBox(height: 8),

          // const Divider(),
          Text(l10n.welcome, textDirection: TextDirection.ltr),

          // botón para ir a la pantalla de login
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              label: l10n.loginButton,
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
            ),
          ),

          // botón para ir a la pantalla de catálogo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: AppButton(
              label: l10n.catalogButton,
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => CatalogPage())),
              variant: AppButtonVariant.success,
            ),
          ),
        ],
      ),
    );
  }
}
