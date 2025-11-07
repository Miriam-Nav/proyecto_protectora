import 'package:flutter/material.dart';
import 'package:proyecto_protectora/catalog/catalog_pages.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/animal_list_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/client_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/inicio_page.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';
class MenuButtons extends StatefulWidget {
  const MenuButtons({super.key});
  @override
  _MenuButtonsState createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons> {
  int _selectedIndex = 0;
  final List<Widget> widgetOptions = const [
    InicioPage(),
    AnimalListPage(),
    CatalogPage(),
    ClientPage(),
    FormularioAdopcion()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Animales'),


            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Catálogo',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Client Page',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Adoptar'),

          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
