import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';

class DatosUsurio extends StatelessWidget {
  const DatosUsurio({super.key});

  // final dynamic sleccionado;

  // const FormularioAdopcion({required this.sleccionado});

  @override
  Widget build(BuildContext context) {
    // nombre del animal que se quiere adoptar
    // String animalNombre = '';
    // String chipAnimal = '';
    // String fotoAnimal = '';
    // for (int i = 0; i < animalesFake.length; i++) {
    //   if (sleccionado == animalesFake[i].idAnimal) {
    //     animalNombre = animalesFake[i].nombre;
    //     chipAnimal = animalesFake[i].chip;
    //     fotoAnimal = animalesFake[i].foto;
    //   }
    // }

    // final brillo = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de usuario'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(top: 25)),
                AppInputText(label: 'Nombre'),
                Padding(padding: const EdgeInsets.only(top: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 247,
                      height: 56,
                      child: AppInputText(label: 'Primer apellido'),
                    ),
                    SizedBox(
                      width: 247,
                      height: 56,
                      child: AppInputText(label: 'Segundo apellido'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 247,
                      height: 56,
                      child: AppInputText(label: 'DNI'),
                    ),
                    SizedBox(
                      width: 247,
                      height: 56,
                      child: AppInputText(label: 'Numero de telefono'),
                    ),
                  ],
                ),
                AppInputText(label: 'Correo electronico'),
                Padding(padding: const EdgeInsets.only(top: 25)),
                AppInputText(label: 'Direccion'),
                Padding(padding: const EdgeInsets.only(top: 5)),
                AppInputText(label: 'Codigo postal'),
                Padding(padding: const EdgeInsets.only(top: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 247,
                      height: 56,
                      child: AppInputText(label: 'Localidad'),
                    ),
                    SizedBox(
                      width: 247,
                      height: 56,
                      child: AppInputText(label: 'Provincia'),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.only(top: 25, bottom: 25)),
                
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // final messenger = ScaffoldMessenger.of(context);
          // await ref
          //     .read(preferencesProvider.notifier)
          //     .updatePreferences(
          //       Preferences(
          //         darkmode: _selDarkMode,
          //         language: Locale(_selLanguage),
          //       ),
          //     );
          // messenger.showSnackBar(
          //   SnackBar(
          //     content: Text(
          //       'Guardado: darkmode = $_selDarkMode, idioma = $_selLanguage',
          //     ),
          //   ),
          // );
        },
        icon: const Icon(Icons.save),
        label: const Text('Guardar'),
      ),
    );
  }
}
