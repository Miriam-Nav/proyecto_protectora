import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/preferences/presentation/pages/preferences_page.dart';

class ProtectoraDrawer extends ConsumerWidget {
  const ProtectoraDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: const Icon(Icons.checklist_rounded),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Protectora',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Preferencias'),
              onTap: () async {
                Navigator.pop(context);
                //await ref.read(todosProvider.notifier).refresh();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ref) => PreferencesPage()),
                );
              },
            ),

            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
