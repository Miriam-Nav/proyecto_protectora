import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_animal_card.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/features/protectora/presentation/providers/animal_provider.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/appbar.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/drawer_page.dart';
import 'package:proyecto_protectora/features/protectora/presentation/pages/formulario_adopcion.dart';

class AnimalListPage extends ConsumerStatefulWidget {
  const AnimalListPage({super.key});

  @override
  ConsumerState<AnimalListPage> createState() => _AnimalListPageState();
}

class _AnimalListPageState extends ConsumerState<AnimalListPage> {
  String? filtroSeleccionado;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final animales = ref.watch(animalesProvider);

    return Scaffold(
      appBar: customAppBar(context, l10n.animales, showDrawer: true),
      drawer: const ProtectoraDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            // --- Barra de filtros arriba ---
            Wrap(
              // espacio horizontal
              spacing: 60.0,
              // espacio vertical si se desborda a otra línea
              runSpacing: 8.0,
              // alineación horizontal
              alignment: WrapAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  // Texto que aparece cuando no hay nada seleccionado
                  hint: Text(l10n.filtrarPor),

                  // Valor actualmente seleccionado en el desplegable
                  value: filtroSeleccionado,

                  // Lista de opciones que se muestran en el menú
                  items: [
                    DropdownMenuItem(value: "perro", child: Text(l10n.perro)),
                    DropdownMenuItem(value: "gato", child: Text(l10n.gato)),
                    DropdownMenuItem(value: "otro", child: Text(l10n.otro)),
                  ],

                  // Acción que se ejecuta cuando el usuario selecciona una opción
                  onChanged: (value) {
                    // setState actualiza el estado del widget con el nuevo valor
                    setState(() {
                      filtroSeleccionado = value;
                    });
                  },
                ),

                // limpiar filtro
                AppButton(
                  onPressed: () {
                    setState(() {
                      filtroSeleccionado = null;
                    });
                  },
                  label: l10n.limpiarFiltro,
                  txColor: appPaletteOf(context).menuButton,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: animales.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Center(child: Text('Error: $err')),
                data: (items) {
                  // Aplica el filtro si existe
                  final filtrados = filtroSeleccionado == null
                      ? items
                      : items.where((animal) {
                          // Aquí depende de cómo esté definido tu modelo Animales
                          // Supongamos que animal.tipo es un enum TipoAnimal { perro, gato, otro }
                          return animal.tipo.name == filtroSeleccionado;
                        }).toList();
                  // Si no hay animales, se muestra un mensaje
                  if (filtrados.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(l10n.noAnimales),
                      ),
                    );
                  }

                  // Si hay animales, se construye la lista
                  return ListView.builder(
                    itemCount: filtrados.length,
                    itemBuilder: (context, index) {
                      final animal = filtrados[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Card personalizada
                            MascotaFavCard(
                              animal: animal,
                              // Al pulsar se navega al formulario de adopción
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => FormularioAdopcion(
                                    seleccionado: animal.idAnimal,
                                  ),
                                ),
                              ),
                              // Muestra botón de adoptar
                              showAdoptButton: true,
                              // Muestra icono de favorito
                              showFavoriteIcon: true,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
