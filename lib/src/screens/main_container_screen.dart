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
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              title: Text('Quitar Anuncios'),
              leading: Icon(Icons.gif),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Idiomas'),
              leading: Icon(Icons.language),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Comparte y Gana'),
              leading: Icon(Icons.card_giftcard),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Comentarios'),
              leading: Icon(Icons.message),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Califícanos'),
              leading: Icon(Icons.star),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
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
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
