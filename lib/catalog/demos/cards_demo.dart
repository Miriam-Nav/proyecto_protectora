import 'package:flutter/material.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
// import 'package:proyecto_protectora/catalog/widgets/showcase_scaffold.dart';
import 'package:proyecto_protectora/core/widgets/app_card.dart';
import 'package:proyecto_protectora/features/protectora/data/fakes/noticias_datafake.dart';
import 'package:proyecto_protectora/features/protectora/data/models/animales.dart';

/// Pantalla que muestra ejemplos de las AppCards personalizadas
class CardsDemo extends StatelessWidget {
  const CardsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold /*ShowcaseScaffold*/ (
      // title: 'Cards',
      appBar: AppBar(title: const Text('Cards'), centerTitle: true),
      //
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---- CARD PRIMARY ----
          const Text('AppCard – Primary'),
          const SizedBox(height: 8),
          AppCard(
            title: 'Card primaria',
            subtitle: 'Ejemplo de estilo principal',
            icon: Icons.pets,
            variant: AppCardVariant.primary,
            onTap: () => print('Card primaria pulsada'),
          ),

          const SizedBox(height: 16),

          // ---- CARD SECONDARY ----
          const Text('AppCard – Secondary'),
          const SizedBox(height: 8),
          AppCard(
            title: 'Card secundaria',
            subtitle: 'Ejemplo con estilo alternativo',
            icon: Icons.favorite,
            variant: AppCardVariant.secondary,
            onTap: () => print('Card secundaria pulsada'),
          ),

          const SizedBox(height: 16),

          // ---- CARD DANGER ----
          const Text('AppCard – Danger'),
          const SizedBox(height: 8),
          AppCard(
            title: 'Card de peligro',
            subtitle: 'Acción irreversible',
            icon: Icons.delete,
            variant: AppCardVariant.danger,
            onTap: () => print('Card danger pulsada'),
          ),

          const SizedBox(height: 16),

          // ---- CARD CON IMAGEN ----
          const Text('AppCard – Con imagen'),
          const SizedBox(height: 8),
          AppCard(
            title: 'Card con imagen',
            subtitle: 'Muestra una foto en lugar del icono',
            image: Image.asset('assets/images/gatito.jpg', fit: BoxFit.cover),
            variant: AppCardVariant.primary,
            onTap: () => print('Card con imagen pulsada'),
          ),

          // ---- CARD NOTIFICACION ----
          const Text('AppInfoCard – Notificacion Base'),
          const SizedBox(height: 8),

          AppNotiCard(
            title: "Visita Veterinario",
            text: "Tienes 2 visitas al veterniario esta semana.",
            badgeText: "Revisar",
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
              sexo: 'Hembra',
              raza: 'Golden Retriever',
              tipo: 'Perro',
              fNacimiento: '2019-08-22',
              estereilizado: 'Sí',
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
