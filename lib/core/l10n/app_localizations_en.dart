// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  // --- Textos generales ---
  @override
  String get appTitle => 'Protectora';

  @override
  String get inicio => 'Inicio';

  @override
  String get openLanguagePicker => 'Cambiar idioma';

  @override
  String get namePagesGestion => 'Gestión de páginas';

  // --- Textos de HomePage ---
  @override
  String get welcome => 'Bienvenido';

  @override
  String get loginButton => 'Login';

  @override
  String get catalogButton => 'Página de Catálogo';

  // --- Textos de ejemplos de internacionalización ---
  @override
  String get concept_plural => 'Plural';

  @override
  String get concept_select => 'Selecciona (género)';

  @override
  String get concept_placeholders => 'Placeholders (fecha/número)';

  @override
  String hello(String name) {
    return '¡Hola, $name!';
  }

  @override
  String applesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count manzanas',
      one: 'Una manzana',
      zero: 'Sin manzanas',
    );
    return '$_temp0';
  }

  @override
  String userGender(String gender) {
    String _temp0 = intl.Intl.selectLogic(gender, {
      'male': 'Él',
      'female': 'Ella',
      'other': 'Elle',
    });
    return '$_temp0 eligió Español.';
  }

  @override
  String dueDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);
    return 'Vence el $dateString';
  }

  @override
  String price(num amount) {
    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
      name: 'EUR',
    );
    final String amountString = amountNumberFormat.format(amount);
    return 'Total: $amountString';
  }
}
