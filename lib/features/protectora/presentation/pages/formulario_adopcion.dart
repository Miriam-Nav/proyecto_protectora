import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/menu_buttons.dart';
import 'package:proyecto_protectora/features/protectora/data/animales_datafake.dart';

class FormularioAdopcion extends StatelessWidget {
  final dynamic sleccionado;

  const FormularioAdopcion({super.key, required this.sleccionado});

  @override
  Widget build(BuildContext context) {
    // nombre del animal que se quiere adoptar
    String animalNombre = '';
    String chipAnimal = '';
    String fotoAnimal = '';
    for (int i = 0; i < animalesFake.length; i++) {
      if (sleccionado == animalesFake[i].idAnimal) {
        animalNombre = animalesFake[i].nombre;
        chipAnimal = animalesFake[i].chip;
        fotoAnimal = animalesFake[i].foto;
      }
    }

    // final brillo = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario de adopcion',
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: [
          // const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              textDirection: TextDirection.ltr,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //imagen del gatoç
                 Image.asset(fotoAnimal, width: 213, height: 257),
                // Padding(
                  
                //   padding: const EdgeInsets.only(left: 15, top: 15),
                //   child: Image.asset(fotoAnimal, width: 213, height: 257),
                // ),
                // const SizedBox(height: 50),
                const Text(
                  'Datos del animal',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15)),

                // AppInputText(label: 'Nombre del animal'),
                AppInputText(
                  label: 'Nombre del animal',
                  seleccion: animalNombre,
                ),
                Padding(padding: const EdgeInsets.only(top: 5)),
                AppInputText(
                  label: 'chip del animal',
                  seleccion: chipAnimal,
                ),
                Padding(padding: const EdgeInsets.only(top: 25)),
                const Text(
                  'Datos del adoptante',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15)),
                AppInputText(label: 'Nombre del adoptante'),
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
                Padding(padding: const EdgeInsets.only(top: 5, bottom: 5)),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Center(
                    child: AppButton(
                      label: "Adoptar",
                      onPressed: () => Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (_) => MenuButtons())),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 5, bottom: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
