import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';

class LocaleSelectorForm extends StatelessWidget {
  final Locale? currentLocale;
  const LocaleSelectorForm({super.key, this.currentLocale});

  @override
  Widget build(BuildContext context) {
    final options = const [Locale('es'), Locale('en'), Locale('it')];
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Título del formulario
          Text(l10n.selecIdioma),
          const SizedBox(height: 12),

          // Generación dinámica de opciones de idioma
          ...options.map((selLocale) {
            final title = switch (selLocale.languageCode) {
              'es' => 'Español',
              'en' => 'English',
              'it' => 'Italiano',
              _ => selLocale.toLanguageTag(),
            };

            // Verificación si la opción coincide con el idioma actual
            final selected =
                currentLocale?.languageCode == selLocale.languageCode;

            return ListTile(
              title: Text(title),
              // Icono de check si está seleccionado
              trailing: selected ? Icon(Icons.check) : null,
              selected: selected,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onTap: () => Navigator.pop(context, selLocale),
            );
          }),
        ],
      ),
    );
  }
}
