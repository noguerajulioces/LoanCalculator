import 'package:flutter/material.dart';
import '../screens/loans_screen.dart'; // Importa las pantallas aquí
import '../screens/home_screen.dart';
import '../screens/donate_screen.dart';
import '../app/bottom_navigation_bar.dart';

class MainContainerScreen extends StatefulWidget {
  @override
  _MainContainerScreenState createState() => _MainContainerScreenState();
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  int _currentIndex = 0;

  // Lista de pantallas para cada índice
  final List<Widget> _screens = [
    HomeScreen(),
    LoansScreen(),
    DonateScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
