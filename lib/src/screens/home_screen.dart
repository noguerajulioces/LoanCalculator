import 'package:flutter/material.dart';
import '../app/app_bar.dart';
import 'package:flutter/services.dart'; // Importa services para usar FilteringTextInputFormatter

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildInputField(
                context, 'Cantidad del préstamo', Icons.monetization_on),
            SizedBox(height: 20),
            buildInputField(context, 'Tasa de interés', Icons.percent),
            SizedBox(height: 20),
            buildInputField(context, 'Duración', Icons.timer),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de pago
              },
              child: const Text('Calcula tu pago'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(BuildContext context, String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Permite solo dígitos
      ],
    );
  }
}
