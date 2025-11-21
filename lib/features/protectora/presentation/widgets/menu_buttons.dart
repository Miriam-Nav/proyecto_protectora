import 'package:flutter/material.dart';
import 'package:proyecto_protectora/catalog/catalog_pages.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/features/auth/data/models/user_model.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/animal_list_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/animalfav_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/client_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/home_page.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

class MenuButtons extends StatefulWidget {
  final User user;
  const MenuButtons({super.key, required this.user});
  @override
  _MenuButtonsState createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons> {
  int _selectedIndex = 0;
  List<Widget> get widgetOptions => [
    // InicioPage(),
    HomePage(user: widget.user),
    ClientPage(),
    AnimalListPage(),
    FavAnimalesPage(),
    // FormularioAdopcion(),
  ];

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
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),

        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: palette.primary,
          unselectedItemColor: palette.onMenuButton,
          backgroundColor: palette.menuButton,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: l10n.buttonProfolio),
            BottomNavigationBarItem(
              icon: const Icon(Icons.new_releases_sharp),
              label: l10n.subtituloNovedades,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: l10n.tituloAnimales),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border),
              label: l10n.tituloFavoritos,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.dashboard),
            //   label: 'Adopta',
            // ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
