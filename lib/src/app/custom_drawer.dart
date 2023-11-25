// custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:todo/src/screens/languages_screen.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Aquí construyes tu Drawer con todos los elementos que necesitas
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            title: const Text('Quitar Anuncios'),
            leading: const Icon(Icons.gif),
            onTap: () => onItemSelected(2),
          ),
          ListTile(
            title: const Text('Idiomas'),
            leading: const Icon(Icons.language),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguageScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Comparte y Gana'),
            leading: const Icon(Icons.card_giftcard),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: const Text('Comentarios'),
            leading: const Icon(Icons.message),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: const Text('Califícanos'),
            leading: const Icon(Icons.star),
            onTap: () => onItemSelected(0),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              children: [
                Divider(),
                Text('Versión 0.1.0'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
