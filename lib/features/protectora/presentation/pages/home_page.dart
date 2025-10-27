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
      // appBar: AppBar(title: const Text('Ajustes')),
      appBar: AppBar(title: const Text('Inicio')),
      body: ListView(
        children: [
          const SizedBox(height: 8),

          // const Divider(),
          Text('Bienvenido', textDirection: TextDirection.ltr),

          // ListTile(
          //   leading: const Icon(Icons.info_outline),
          //   title: const Text('Estado actual del tema'),
          //   subtitle: Text(modoOscuro ? 'Oscuro' : 'Claro'),
          // ),
          // const SizedBox(height: 24),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child:
          //   // buttons_claro(),
          // ),
          // const SizedBox(height: 24),

          // botón para ir a la pantalla de login
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              label: 'Loging',
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
            ),
            // button_Paginademostracion( pantallaDestino: LoginScreen(), texto: "Logeate/Registrate"),
            // child: FilledButton(
            // onPressed: () => Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => const PaginaDemostracion()),
            // ),
            // child: const Text('Ir a pantalla de demostración'),
          ),

          // botón para ir a la pantalla de catálogo
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

          // ),
          // const SizedBox(height: 24),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: FilledButton(
          //     onPressed: () => Navigator.of(
          //       context,
          //     ).push(MaterialPageRoute(builder: (_) => const CatalogPage())),
          //     child: const Text('Ir a pantalla Catalogo'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
