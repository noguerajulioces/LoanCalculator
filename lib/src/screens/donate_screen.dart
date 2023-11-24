import 'package:flutter/material.dart';
import '../app/app_bar.dart'; // Asegúrate de que la ruta de importación sea correcta

class DonateScreen extends StatelessWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Mis Préstamos',
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Todo esto es posible gracias a ti!',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'La Calculadora de Préstamos es completamente gratis y estamos trabajando muy duro para hacer nuevas aplicaciones! Si te gusta nuestra aplicación, puedes apoyar a nuestro equipo con un poco de amor para alimentar nuestros esfuerzos! A cambio, vamos a habilitar las notificaciones sobre cuándo tienes que pagar tus préstamos y eliminaremos los anuncios!',
              // El resto del texto explicativo
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              'assets/dog.png', // Asegúrate de tener una imagen de perro en tus assets
              height: 200, // Ajusta la altura según sea necesario
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Tus donaciones nos ayudan muchísimo\nAlimenta nuestras mascotas',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          // Botones de donación
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Acción para donar USD 2,99
                },
                child: const Text('USD 2,99'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción para donar USD 4,99
                },
                child: const Text('USD 4,99'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción para donar USD 6,99
                },
                child: const Text('USD 6,99'),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Acción para restaurar compras
              },
              child: const Text('RESTAURAR COMPRA'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Color del botón
              ),
            ),
          ),
          // Agrega más widgets según sea necesario
        ],
      ),
      // El BottomNavigationBar se manejaría en el widget contenedor
    );
  }
}
