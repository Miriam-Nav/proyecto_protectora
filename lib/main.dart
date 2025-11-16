import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/auth_gate.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/menu_buttons.dart';
import 'package:proyecto_protectora/features/preferences/controllers/preferences_controller.dart';
import 'package:proyecto_protectora/app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obten el estado async de las preferencias
    final prefsAsync = ref.watch(preferencesProvider);

    // Valores por defecto
    Locale selectedLocale = const Locale('es');
    bool modoOscuro = false;

    // Si las preferencias ya cargaron correctamente se actualiza
    prefsAsync.when(
      data: (prefs) {
        selectedLocale = prefs.language;
        modoOscuro = prefs.darkmode;
      },
      loading: () {
        // Valor por defecto mientras carga
        selectedLocale = const Locale('es');
        modoOscuro = false;
      },
      error: (_, __) {
        // Valores por defecto en caso de error
        selectedLocale = const Locale('es');
        modoOscuro = false;
      },
    );

    return MaterialApp(
      title: 'Protectora App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: modoOscuro ? ThemeMode.dark : ThemeMode.light,
      locale: selectedLocale,
      supportedLocales: const [Locale('en'), Locale('es'), Locale('it')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // home: AuthGate(builder: (user) => HomePage(user: user)),
      // home: LoginPage(),
      home: AuthGate(builder: (user) => MenuButtons(user: user)),
    );
  }
}
