import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';
import 'package:proyecto_protectora/core/widgets/app_card.dart';
import 'package:proyecto_protectora/features/protectora/data/fakes/noticias_datafake.dart';

/// Pantalla que muestra ejemplos de las AppCards personalizadas
class CardsDemo extends StatelessWidget {
  const CardsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold /*ShowcaseScaffold*/ (
      appBar: AppBar(title: const Text('Cards'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---- CARD NOTIFICACION ----
          const Text('AppInfoCard – Notificacion Base'),
          const SizedBox(height: 8),

          AppNotiCard(
            title: "Visita Veterinario",
            text: "Tienes 2 visitas al veterniario esta semana.",
            variant: AppCardVariant.cardBlue,
          ),

          // ---- CARD INFORMATIVA ----
          const Text('AppInfoCard – Informativa personalizada'),
          const SizedBox(height: 8),

          AppInfoCard(
            title: 'Max - Adoptado',
            subtitle: '11/10/2025 - 16:32',
            badgeText: 'Adopción',
            variant: AppCardVariant.cardGreen,
            onTap: () => print('Card de adopción pulsada'),
          ),

          AppInfoCard(
            title: 'Luna - Vacunado',
            subtitle: '7/10/2025 - 11:15',
            badgeText: 'Veterinario',
            variant: AppCardVariant.cardBlue,
            onTap: () => print('Card de veterinario pulsada'),
          ),

          const SizedBox(height: 16),
          const Text('Mascota Mini Card'),
          const SizedBox(height: 8),
          MascotaMiniCard(
            image: 'assets/images/gatito.jpg',
            title: "Leon",
            text: "Cariñoso y tranquilo.",
            onPressed: () {},
          ),

          const SizedBox(height: 16),
          const Text('Mascota Card'),
          const SizedBox(height: 8),

          MascotaFavCard(
            animal: Animales(
              idAnimal: '1',
              nombre: 'Nala',
              sexo: Sexo.macho,
              raza: 'Golden Retriever',
              tipo: TipoAnimal.perro,
              fNacimiento: DateTime.now(),
              esterilizado: true,
              chip: 'CHIP001',
              descripcion: 'Dulce y sociable',
              foto: 'https://cataas.com/cat?random=1',
            ),
            variant: AppMascotaCardVariant.primary,
            showAdoptButton: true,
            showFavoriteIcon: true,
            onAdoptPressed: () {
              print("Adoptar a Nala pulsado");
            },
          ),
          const SizedBox(height: 16),
          const Text('Noticia Card'),
          const SizedBox(height: 8),
          NoticiaCard(noticia: noticiasFake[0]),
        ],
      ),
    );
  }
}
