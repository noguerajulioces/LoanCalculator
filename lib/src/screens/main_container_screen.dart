import 'package:flutter/material.dart';
import 'package:todo/src/screens/languages_screen.dart';
import '../screens/loans_screen.dart';
import '../screens/home_screen.dart';
import '../screens/donate_screen.dart';
import '../app/bottom_navigation_bar.dart';
import '../app/app_bar.dart';
import '../app/custom_drawer.dart';

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
    LanguageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Mis Préstamos',
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      drawer: CustomDrawer(
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
