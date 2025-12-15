import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/features/auth/data/models/usuario_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/animal_lista_pag.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/animalfav_pag.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/cliente_pag.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/inicio_pag.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

class MenuButtons extends StatefulWidget {
  final Usuario user;
  const MenuButtons({super.key, required this.user});

  @override
  MenuButtonsState createState() => MenuButtonsState();
}

class MenuButtonsState extends State<MenuButtons> {
  // índice de la pestaña seleccionada
  int _selectedIndex = 0;

  // Lista de páginas
  List<Widget> get widgetOptions => [
    InicioPag(user: widget.user),
    ClientePag(),
    AnimalListaPag(),
    FavAnimalesPag(),
  ];

  // Actualiza el índice cuando se pulsa un botón en la barra inferior
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final palette = appPaletteOf(context);

    return Scaffold(
      // El body muestra la página correspondiente al índice seleccionado
      body: widgetOptions[_selectedIndex],

      // Barra de navegación inferior con esquinas redondeadas
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          // Mostrar etiquetas seleccionadas
          showSelectedLabels: true,
          // Mostrar etiquetas no seleccionadas
          showUnselectedLabels: true,
          // Tipo fijo (no desplazable)
          type: BottomNavigationBarType.fixed,
          // Color del ítem seleccionado
          selectedItemColor: palette.primary,
          // Color de ítems no seleccionados
          unselectedItemColor: palette.onMenuButton,
          // Fondo de la barra
          backgroundColor: palette.menuButton,
          // Botones
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: l10n.buttonProfile,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.new_releases_sharp),
              label: l10n.novedades,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: l10n.animales,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: l10n.favoritos,
            ),
          ],
          // Índice actual
          currentIndex: _selectedIndex,
          // Acción al pulsar un ítem
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
