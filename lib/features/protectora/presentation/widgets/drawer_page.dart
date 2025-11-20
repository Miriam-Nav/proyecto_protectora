import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/catalog/catalog_pages.dart';
import 'package:proyecto_protectora/features/auth/controllers/auth_controller.dart';
import 'package:proyecto_protectora/features/auth/data/models/user_model.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/login_page.dart';
import 'package:proyecto_protectora/features/auth/presentation/providers/user_provider.dart';
import 'package:proyecto_protectora/features/preferences/presentation/pages/preferences_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/datos_usuario.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/home_page.dart';

class ProtectoraDrawer extends ConsumerWidget {
  const ProtectoraDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Container(
        color: appPaletteOf(context).background,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: appPaletteOf(context).primary,
                  gradient: LinearGradient(
                    colors: [
                      appPaletteOf(context).primary,
                      appPaletteOf(context).degradado,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/images/gato_conn_perro_login.png",
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Protectora',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: appPaletteOf(context).onPrimary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Usuario'),
                onTap: () async {
                  Navigator.pop(context);
                  final usuario = ref.read(authControllerProvider).value;
                  if (usuario != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DatosUsuario(usuario: usuario),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No hay usuario logeado')),
                    );
                  }
                },
              ),

              ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text('Preferencias'),
                onTap: () async {
                  Navigator.pop(context);
                  //await ref.read(todosProvider.notifier).refresh();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ref) => PreferencesPage()),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Catálogo'),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ref) => CatalogPage()),
                  );
                },
              ),

              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Cerrar sesión'),
                onTap: () async {
                  Navigator.pop(context);
                  await ref.read(authControllerProvider.notifier).signOut();

                  // Después de cerrar sesión va al login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
