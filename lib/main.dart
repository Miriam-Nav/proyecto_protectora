import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kClaveModoOscuro = 'modoOscuro';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Leemos la preferencia antes de arrancar la app
  final preferencias = await SharedPreferences.getInstance();
  final modoOscuroGuardado = preferencias.getBool(kClaveModoOscuro) ?? false;

  runApp(Aplicacion(modoOscuroInicial: modoOscuroGuardado));
}

class Aplicacion extends StatefulWidget {
  final bool modoOscuroInicial;
  const Aplicacion({super.key, required this.modoOscuroInicial});

  @override
  State<Aplicacion> createState() => _EstadoAplicacion();
}

class _EstadoAplicacion extends State<Aplicacion> {
  late bool _modoOscuro;

  @override
  void initState() {
    super.initState();
    _modoOscuro = widget.modoOscuroInicial;
  }

  Future<void> _actualizarModoOscuro(bool valor) async {
    // Guardamos en shared_preferences
    final preferencias = await SharedPreferences.getInstance();
    await preferencias.setBool(kClaveModoOscuro, valor);

    // Actualizamos el tema en caliente
    setState(() => _modoOscuro = valor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini App de Ajustes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _modoOscuro ? ThemeMode.dark : ThemeMode.light,
      home: PaginaAjustes(
        modoOscuro: _modoOscuro,
        onCambioModoOscuro: _actualizarModoOscuro,
      ),
    );
  }
}
