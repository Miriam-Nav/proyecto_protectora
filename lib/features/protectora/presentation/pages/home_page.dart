import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_card.dart';
import 'package:proyecto_protectora/features/auth/data/models/user_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/adopcion_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/crear_editar_animal.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: customAppBar(context, l10n.inicio, showDrawer: true),

      drawer: ProtectoraDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 5),
            Text(
              l10n.hello(user.username),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: appPaletteOf(context).secondary,
              ),
            ),
            const SizedBox(height: 24),
            Consumer(
              builder: (context, ref, _) {
                final adopcionesAsync = ref.watch(adopcionesProvider);

                return adopcionesAsync.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (e, _) => Text('Error: $e'),
                  data: (adopciones) {
                    return AppNotiCard(
                      title: l10n.totalAdop,
                      text: '${l10n.revisarAdop} ${adopciones.length}',
                      variant: AppCardVariant.cardBlue,
                    );
                  },
                );
              },
            ),

            SizedBox(height: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppRoundedActionButtonBorde(
                  leadingIcon: Icons.pets,
                  label: l10n.gestionarAnimales,
                  onPressed: () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => CrearAnimal())),
                  borderColor: appPaletteOf(context).primary,
                ),
              ],
            ),

            SizedBox(height: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.actividadReciente,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                Consumer(
                  builder: (context, ref, _) {
                    final adopcionesAsync = ref.watch(adopcionesProvider);

                    return adopcionesAsync.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, _) => Text('Error: $e'),
                      data: (adopciones) {
                        if (adopciones.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(l10n.sinActividadReciente),
                          );
                        }

                        return Column(
                          children: [
                            for (final adopcion in adopciones)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: AppInfoCard(
                                  title:
                                      '${adopcion.nombreAnimal} ${l10n.solicitudAdopcion}',

                                  subtitle: DateFormat(
                                    'dd/MM/yyyy - HH:mm',
                                  ).format(adopcion.fechaAdopcion),
                                  badgeText: l10n.adopcion,
                                  variant: AppCardVariant.cardGreen,
                                ),
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
