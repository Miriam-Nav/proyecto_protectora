import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/features/auth/presentation/widgets/menu_buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/protectora/controllers/animal_controller.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';

class FormularioAdopcion extends ConsumerWidget {
  final dynamic sleccionado;

  const FormularioAdopcion({super.key, required this.sleccionado});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final repo = AnimalController(); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de adopcion', textAlign: TextAlign.center),
      ),
      body: FutureBuilder<Animales?>(
        future: repo.getOne(sleccionado),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Animal no encontrado'));
          }

          final animal = snapshot.data!;

          return ListView(
            children: [
              // const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  textDirection: TextDirection.ltr,
                  children: [
                    //imagen del gato
                    Image.asset(animal.foto, width: 213, height: 257),
                    const Text(
                      'Datos del animal',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 15)),
                    AppInputText(
                      label: 'Nombre del animal',
                      seleccion: animal.nombre,
                    ),
                    Padding(padding: const EdgeInsets.only(top: 5)),
                    AppInputText(
                      label: 'chip del animal',
                      seleccion: animal.chip,
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
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => MenuButtons()),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 5, bottom: 15)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
