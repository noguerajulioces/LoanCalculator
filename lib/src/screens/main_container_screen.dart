import 'package:flutter/material.dart';
import '../screens/loans_screen.dart'; // Importa las pantallas aquí
import '../screens/home_screen.dart';
import '../screens/donate_screen.dart';
import '../app/bottom_navigation_bar.dart';
import '../app/app_bar.dart'; // Asegúrate de que la ruta de importación sea correcta

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
      appBar: CustomAppBar(
        title: 'Mis Préstamos',
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ), // Muestra la pantalla seleccionada sin perder el estado
      drawer: Drawer(
        // Aquí construyes tu Drawer con todos los elementos que necesitas
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Encabezado del Drawer'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: Text('Mis Préstamos'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: Text('Donar'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            // Agrega más ítems según sea necesario
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
