import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/controllers/animal_controller.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';

class DetalleAnimal extends StatelessWidget {
  final int seleccionado;
  final String nombreAnimal;
  DetalleAnimal({super.key, required this.seleccionado, required this.nombreAnimal});

  final repo = AnimalController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Conoce a $nombreAnimal'), centerTitle: true),
      body: FutureBuilder<Animales?>(
        future: repo.getOne(seleccionado),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Animal no encontrado'));
          }
          final animal = snapshot.data!;
          return ListView(
            children: [
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 25)),
                    MascotaCard(
                      animal: animal,
                    ),
                    Padding(padding: const EdgeInsets.only(top: 25)),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Center(
                        child: AppButton(
                          label: "Adoptar",
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => FormularioAdopcion(
                                sleccionado: animal.idAnimal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 25)),
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
