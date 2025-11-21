import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/preferences/controllers/preferences_controller.dart';
import 'package:proyecto_protectora/features/preferences/data/models/preferences.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

class PreferencesPage extends ConsumerStatefulWidget {
  const PreferencesPage({super.key});
  @override
  ConsumerState<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends ConsumerState<PreferencesPage> {
  late bool _selDarkMode;
  late String _selLanguage;

  @override
  void initState() {
    super.initState();
    final prefs = ref.read(preferencesProvider).value;
    if (prefs != null) {
      _selDarkMode = prefs.darkmode;
      _selLanguage = prefs.language.languageCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Preferencias"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: [
          Text("Apariencia"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    _selDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Modo oscuro',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Switch(
                value: _selDarkMode,
                onChanged: (val) {
                  setState(() {
                    _selDarkMode = val;
                  });
                },
              ),
            ],
          ),

          const Divider(height: 32),

          Text("Selección de Idioma"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.language, color: appPaletteOf(context).cardBlue),
                  SizedBox(width: 12),
                  Text(
                    'Idioma',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              DropdownButton<String>(
                value: _selLanguage,
                underline: const SizedBox(), // quita la línea inferior
                onChanged: (String? value) {
                  setState(() {
                    _selLanguage = value!;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'es', child: Text('Español')),
                  DropdownMenuItem(value: 'en', child: Text('English')),
                ],
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: AppButton(
            icon: Icons.save,
            label: 'Guardar cambios',
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              await ref
                  .read(preferencesProvider.notifier)
                  .updatePreferences(
                    Preferences(
                      darkmode: _selDarkMode,
                      language: Locale(_selLanguage),
                    ),
                  );
              messenger.showSnackBar(
                SnackBar(
                  content: Text(
                    'Guardado: darkmode = $_selDarkMode, idioma = $_selLanguage',
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
