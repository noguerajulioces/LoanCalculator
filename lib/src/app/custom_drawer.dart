// custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:todo/src/screens/languages_screen.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const CustomDrawer({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Aquí construyes tu Drawer con todos los elementos que necesitas
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            title: Text('Quitar Anuncios'),
            leading: Icon(Icons.gif),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: Text('Idiomas'),
            leading: Icon(Icons.language),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LanguageScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Comparte y Gana'),
            leading: Icon(Icons.card_giftcard),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: Text('Comentarios'),
            leading: Icon(Icons.message),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: Text('Califícanos'),
            leading: Icon(Icons.star),
            onTap: () => onItemSelected(0),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Divider(),
                Text('Versión de la app 0.1.0'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
