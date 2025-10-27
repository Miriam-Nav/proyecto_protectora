import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/home_page.dart';
import 'package:proyecto_protectora/features/auth/presentation/providers/preferences_providers.dart';
import 'package:proyecto_protectora/app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(preferencesProvider);

    final modoOscuro = prefsAsync.maybeWhen(
      data: (p) => p.darkmode,
      orElse: () => false,
    );

    return MaterialApp(
      title: 'Protectora utilizando Riverpod',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: modoOscuro ? ThemeMode.dark : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
