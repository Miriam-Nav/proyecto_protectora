import 'package:flutter/material.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/demostracion_page.dart';
import 'package:proyecto_protectora/catalog/catalog_pages.dart';

class PaginaAjustes extends StatefulWidget {
  final bool modoOscuro;
  final ValueChanged<bool> onCambioModoOscuro;

  const PaginaAjustes({
    super.key,
    required this.modoOscuro,
    required this.onCambioModoOscuro,
  });

  @override
  State<PaginaAjustes> createState() => _EstadoPaginaAjustes();
}

class _EstadoPaginaAjustes extends State<PaginaAjustes> {
  late bool _modoOscuroLocal;

  @override
  void initState() {
    super.initState();
    _modoOscuroLocal = widget.modoOscuro;
  }

  Future<void> _alternarModoOscuro(bool valor) async {
    setState(() => _modoOscuroLocal = valor);
    widget.onCambioModoOscuro(valor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Modo oscuro'),
            subtitle: const Text('Guarda la preferencia en el dispositivo'),
            value: _modoOscuroLocal,
            onChanged: _alternarModoOscuro,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Estado actual del tema'),
            subtitle: Text(_modoOscuroLocal ? 'Oscuro' : 'Claro'),
          ),
          const SizedBox(height: 24),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child:
          //       // FilledButton(
          //       //   onPressed: () => Navigator.of(context).push(
          //       //     MaterialPageRoute(builder: (_) => const PaginaDemostracion()),
          //       //   ),
          //       //   child: const Text('Ir a pantalla de demostración'),
          //       // ),
          //       // buttons_claro(),
          //       buttons_claro(),
          // ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FilledButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PaginaDemostracion()),
              ),
              child: const Text('Ir a pantalla de demostración'),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FilledButton(
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const CatalogPage())),
              child: const Text('Ir a pantalla Catalogo'),
            ),
          ),
        ],
      ),
    );
  }
}
