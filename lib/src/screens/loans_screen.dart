import 'package:flutter/material.dart';
import '../app/app_bar.dart'; // Asegúrate de que la ruta de importación sea correcta

class LoansScreen extends StatelessWidget {
  const LoansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Mis Préstamos',
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text('Mi Préstamo'),
                  subtitle: Text('Préstamo: Gs. 25.000.000,00'),
                  trailing:
                      Text('24 nov 2023'), // Ejemplo de fecha del préstamo
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pago:'),
                          Text('Gs. 1.321.777,43'),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Duración:'),
                          Text('24 meses'),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Interés:'),
                          Text('24 %'),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Capital:'),
                      Text('Gs. 0,00'),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total a Pagar:'),
                      Text('Gs. 31.722.658,32'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Aquí puedes añadir otros elementos como la sección de publicidad, etc.
        ],
      ),
      // Incluye tu BottomNavigationBar aquí si es necesario
    );
  }
}
