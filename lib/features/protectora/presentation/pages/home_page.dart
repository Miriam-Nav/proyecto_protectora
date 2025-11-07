import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/demostracion_page.dart';
import 'package:proyecto_protectora/catalog/catalog_pages.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/login_page.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/sing_up_screen.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/veri_screen.dart';
import 'package:proyecto_protectora/features/auth/presentation/providers/preferences_providers.dart';

//pagina principal
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(preferencesProvider);

    // obtiene el valor actual del modo oscuro desde Riverpod
    final modoOscuro = prefsAsync.maybeWhen(
      data: (p) => p.darkmode,
      orElse: () => false,
    );

    return Scaffold(
      /////////////////////////////////////////////
      appBar: AppBar(title: const Text('Inicio')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Text('Bienvenido', textDirection: TextDirection.ltr),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              label: 'Loging',
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: AppButton(
              label: 'Página de Catálogo',
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
