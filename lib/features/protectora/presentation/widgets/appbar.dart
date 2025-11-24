import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

// Función que devuelve un AppBar personalizado
AppBar customAppBar(
  BuildContext context,
  String title, {
  // Si es true muestra el drawer
  bool showDrawer = false,
  List<Widget>? actions,
}) {
  final palette = appPaletteOf(context);

  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    // Altura del AppBar
    toolbarHeight: 70,
    // Ancho del área de leading (icono izquierdo)
    leadingWidth: 120,
    // Título
    title: Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        color: appPaletteOf(context).onPrimary,
      ),
    ),

    // Si showDrawer es true, muestra el icono para abrir el Drawer
    // Si no, muestra una flecha
    leading: showDrawer
        ? Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: palette.onPrimary, size: 24),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )
        : IconButton(
            icon: Icon(Icons.arrow_back, color: palette.onPrimary, size: 24),
            onPressed: () => Navigator.of(context).maybePop(),
          ),

    // Acciones opcionales (iconos a la derecha)
    actions: actions,

    // Fondo con drgradado y bordes redondeados
    flexibleSpace: ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(100)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [palette.onDegradado, palette.degradado],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    ),
  );
}
