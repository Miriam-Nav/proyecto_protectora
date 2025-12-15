import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/preferences/controllers/preferencias_controller.dart';
import 'package:proyecto_protectora/features/preferences/data/models/preferencias.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

class PreferenciasPag extends ConsumerStatefulWidget {
  const PreferenciasPag({super.key});
  @override
  ConsumerState<PreferenciasPag> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends ConsumerState<PreferenciasPag> {
  late bool _selModoOsuro;
  late String _selIdioma;

  @override
  void initState() {
    super.initState();
    // Se leen las preferencias actuales
    final prefs = ref.read(preferencesProvider).value;
    if (prefs != null) {
      _selModoOsuro = prefs.modoOscuro;
      _selIdioma = prefs.idioma.languageCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: customAppBar(context, l10n.preferencias),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: [
          // Sección de apariencia
          Text(l10n.apariencia),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Icono según modo oscuro o claro
                  Icon(
                    _selModoOsuro ? Icons.dark_mode : Icons.light_mode,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    l10n.modoOsc,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              // Interruptor para activar/desactivar modo oscuro
              Switch(
                value: _selModoOsuro,
                onChanged: (val) {
                  setState(() {
                    _selModoOsuro = val;
                  });
                },
              ),
            ],
          ),

          const Divider(height: 32),

          // Selección de idioma
          Text(l10n.selecIdioma),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.language, color: appPaletteOf(context).cardBlue),
                  SizedBox(width: 12),
                  Text(
                    l10n.idioma,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              // Selector desplegable de idioma
              DropdownButton<String>(
                value: _selIdioma,
                underline: const SizedBox(),
                onChanged: (String? value) {
                  setState(() {
                    _selIdioma = value!;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'es', child: Text('Español')),
                  DropdownMenuItem(value: 'en', child: Text('English')),
                  DropdownMenuItem(value: 'it', child: Text('Italiano')),
                ],
              ),
            ],
          ),
        ],
      ),

      // Botón para guardar cambios
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: AppButton(
            icon: Icons.save,
            label: l10n.guardarCambios,
            txColor: appPaletteOf(context).onSecondary,
            rounded: 5,
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              // Se actualizan las preferencias en el provider
              await ref
                  .read(preferencesProvider.notifier)
                  .updatePreferences(
                    Preferences(
                      modoOscuro: _selModoOsuro,
                      idioma: Locale(_selIdioma),
                    ),
                  );
              // Se muestra un mensaje de confirmación
              messenger.showSnackBar(
                SnackBar(
                  content: Text(
                    '${l10n.guardado}: DarkMode = $_selModoOsuro, ${l10n.idioma} = $_selIdioma',
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
