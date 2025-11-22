import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/catalog/catalog_pages.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/features/auth/controllers/auth_controller.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/login_page.dart';
import 'package:proyecto_protectora/features/preferences/presentation/pages/preferences_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/datos_usuario.dart';

class ProtectoraDrawer extends ConsumerWidget {
  const ProtectoraDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final usuario = ref.watch(authControllerProvider).value;
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
                      appPaletteOf(context).onDegradado,
                      appPaletteOf(context).degradado,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: appPaletteOf(
                            context,
                          ).background.withAlpha((0.3 * 255).round()),

                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: appPaletteOf(context).background,
                        child: Image.network(
                          usuario?.image ?? l10n.usuario,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            usuario?.firstName ?? l10n.invitado,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: appPaletteOf(context).onPrimary,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            usuario?.email ?? l10n.sinCorreo,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: appPaletteOf(context).onPrimary,
                                ),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: Text(l10n.usuario),
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
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(l10n.noLoggin)));
                  }
                },
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(l10n.preferencias),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ref) => PreferencesPage()),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.dashboard),
                title: Text(l10n.catalogo),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ref) => CatalogPage()),
                  );
                },
              ),

              // Separador con patita
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(color: appPaletteOf(context).onMenuButton),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.pets,
                        size: 20,
                        color: appPaletteOf(context).onMenuButton,
                      ),
                    ),
                    Expanded(
                      child: Divider(color: appPaletteOf(context).onMenuButton),
                    ),
                  ],
                ),
              ),

              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: appPaletteOf(context).danger,
                ),
                title: Text(
                  l10n.cerrarSesion,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: appPaletteOf(context).danger,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onTap: () async {
                  Navigator.pop(context);
                  await ref.read(authControllerProvider.notifier).signOut();

                  // Evita usar context si el widget ya no existe
                  if (!context.mounted) {
                    return;
                  }

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
