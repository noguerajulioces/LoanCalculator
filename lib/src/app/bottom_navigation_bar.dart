import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Mis Préstamos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Donar',
        ),
      ],
      // Aquí puedes añadir más personalizaciones como el color de fondo, el color de los ítems, etc.
    );
  }
}
