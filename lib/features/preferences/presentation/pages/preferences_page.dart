import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/preferences/controllers/preferences_controller.dart';
import 'package:proyecto_protectora/features/preferences/data/models/preferences.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';

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
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Apariencia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // --- Modo claro/oscuro ---
              Row(
                children: [
                  Icon(Icons.light_mode),
                  Switch(
                    value: _selDarkMode,
                    onChanged: (val) {
                      setState(() {
                        _selDarkMode = val;
                      });
                    },
                  ),
                  Icon(Icons.dark_mode),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          // --- Selección de idioma ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Idioma',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              DropdownMenu<String>(
                initialSelection: _selLanguage,
                onSelected: (String? value) {
                  setState(() {
                    _selLanguage = value!;
                  });
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'es', label: 'ES'),
                  DropdownMenuEntry(value: 'en', label: 'EN'),
                  DropdownMenuEntry(value: 'it', label: 'IT'),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
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
        icon: const Icon(Icons.save),
        label: const Text('Guardar'),
      ),
    );
  }
}
