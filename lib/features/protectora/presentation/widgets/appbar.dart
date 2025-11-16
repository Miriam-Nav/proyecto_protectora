import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

AppBar customAppBar(
  BuildContext context,
  String title, {
  bool showDrawer = false,
  List<Widget>? actions,
}) {
  final palette = appPaletteOf(context);

  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 70,
    leadingWidth: 120,
    actionsPadding: const EdgeInsets.symmetric(horizontal: 24),
    title: Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: appPaletteOf(context).onPrimary,
      ),
    ),

    // Si hay drawer muestra flecha atrás. Si no, no
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

    actions: actions,

    flexibleSpace: ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(100)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [palette.primary, palette.degradado],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    ),
  );
}
