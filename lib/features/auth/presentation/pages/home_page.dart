import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart'
    show AppRoundedActionButton, AppButton;
import 'package:proyecto_protectora/core/widgets/button_demo.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/demostracion_page.dart';
import 'package:proyecto_protectora/catalog/catalog_pages.dart';
import 'package:proyecto_protectora/catalog/demos/buttons_demo.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/login_page.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/sing_up_screen.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/veri_screen.dart';

//pagina principal
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
  PageController controller = PageController(initialPage: 0);
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
      // body: PageView.builder(

      // physics: const NeverScrollableScrollPhysics(),
      // itemCount: 3,
      // controller: controller,
      // itemBuilder: (context, index) {
      //   if (index == 0) {
      //     return LoginScreen(controller: controller);
      //   } else if (index == 1) {
      //     return SingUpScreen(controller: controller);
      //   } else {
      //     return VerifyScreen(controller: controller);
      //   }
      // },
      // ),
      /////////////////////////////////////////////
      // appBar: AppBar(title: const Text('Ajustes')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Modo oscuro'),
            subtitle: const Text('Guarda la preferencia en el dispositivo'),
            value: _modoOscuroLocal,
            onChanged: _alternarModoOscuro,
          ),
          // const Divider(),
          Text('Biembenido', textDirection: TextDirection.ltr),

          // ListTile(
          //   leading: const Icon(Icons.info_outline),
          //   title: const Text('Estado actual del tema'),
          //   subtitle: Text(_modoOscuroLocal ? 'Oscuro' : 'Claro'),
          // ),
          // const SizedBox(height: 24),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child:
          //   // buttons_claro(),
          // ),
          // const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              label: 'loging',
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => LoginScreen())),
            ),
            // button_Paginademostracion( pantallaDestino: LoginScreen(), texto: "Logeate/Registrate"),
            // child: FilledButton(
            // onPressed: () => Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => const PaginaDemostracion()),
            // ),
            // child: const Text('Ir a pantalla de demostración'),
          ),
          // ),
          // const SizedBox(height: 24),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: FilledButton(
          //     onPressed: () => Navigator.of(
          //       context,
          //     ).push(MaterialPageRoute(builder: (_) => const CatalogPage())),
          //     child: const Text('Ir a pantalla Catalogo'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
