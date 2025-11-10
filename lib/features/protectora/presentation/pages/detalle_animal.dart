import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/data/animales_datafake.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';

class DetalleAnimal extends StatelessWidget {
  final dynamic seleccionado;

  const DetalleAnimal({super.key, required this.seleccionado});

  @override
  Widget build(BuildContext context) {
    // datos del animal
    int identificadorAnimal = 0;
    String nombreAnimal = '';
    String sexoAnimal = '';
    String razaAnimal = '';
    String tipoAnimal = '';
    String fNacimientoAnimal = '';
    String estereilizadoAnimal = '';
    String chipAnimal = '';
    String descripcionAnimal = '';
    String fotoAnimal = '';
    for (int i = 0; i < animalesFake.length; i++) {
      if (seleccionado == animalesFake[i].idAnimal) {
        identificadorAnimal = animalesFake[i].idAnimal;
        nombreAnimal = animalesFake[i].nombre;
        sexoAnimal = animalesFake[i].sexo;
        razaAnimal = animalesFake[i].raza;
        tipoAnimal = animalesFake[i].tipo;
        fNacimientoAnimal = animalesFake[i].fNacimiento;
        estereilizadoAnimal = animalesFake[i].estereilizado;
        chipAnimal = animalesFake[i].chip;
        descripcionAnimal = animalesFake[i].descripcion;
        fotoAnimal = animalesFake[i].foto;
      }
    }

    // final brillo = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(title: Text('Conoce a $nombreAnimal'), centerTitle: true),
      body: ListView(
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
                  image: fotoAnimal,
                  nombre: nombreAnimal,
                  sexo: sexoAnimal,
                  raza: razaAnimal,
                  fNacimiento: fNacimientoAnimal,
                  esterilizado: estereilizadoAnimal,
                  chip: chipAnimal,
                  text: descripcionAnimal,
                  tipo: tipoAnimal,
                ),
                Padding(padding: const EdgeInsets.only(top: 25)),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Center(
                    child: AppButton(
                      label: "Adoptar",
                      onPressed: () => Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (_) => FormularioAdopcion(sleccionado: identificadorAnimal,))),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 25)),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}
