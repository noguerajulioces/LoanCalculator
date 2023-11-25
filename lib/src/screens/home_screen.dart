import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildInputField(
              context,
              'Cantidad del préstamo',
              'GS. ',
              Icons.monetization_on,
            ),
            const SizedBox(
              height: 20,
            ),
            buildInputField(
              context,
              'Tasa de interés',
              '',
              Icons.percent,
            ),
            const SizedBox(
              height: 20,
            ),
            buildInputField(
              context,
              'Duración',
              '',
              Icons.timer,
            ),
            const SizedBox(height: 20),
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

  Widget buildInputField(
      BuildContext context, String label, String coinSymbol, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        prefixText: coinSymbol,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
