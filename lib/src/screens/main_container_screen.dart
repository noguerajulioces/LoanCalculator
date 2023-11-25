import 'package:flutter/material.dart';
import '../screens/loans_screen.dart';
import '../screens/home_screen.dart';
import '../screens/donate_screen.dart';
import '../app/bottom_navigation_bar.dart';
import '../app/app_bar.dart';
import '../app/custom_drawer.dart';

class MainContainerScreen extends StatefulWidget {
  const MainContainerScreen({super.key});

  @override
  _MainContainerScreenState createState() => _MainContainerScreenState();
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  int _currentIndex = 0;

  // Lista de pantallas para cada índice
  final List<Widget> _screens = [
    const HomeScreen(),
    const LoansScreen(),
    const DonateScreen(),
  ];

  // Lista de titles
  final List<String> _titles = [
    'Préstamos',
    'Mis préstamos',
    'Donar',
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
        title: _titles[_currentIndex],
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
