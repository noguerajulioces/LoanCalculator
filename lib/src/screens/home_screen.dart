import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

String getLocalCurrencySymbol() {
  var format = NumberFormat.simpleCurrency(locale: Intl.systemLocale);
  return format.currencySymbol;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String currencySymbol = getLocalCurrencySymbol();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildInputField(
              context,
              AppLocalizations.of(context)!.loanAmount,
              currencySymbol,
              Icons.monetization_on,
            ),
            const SizedBox(
              height: 20,
            ),
            buildInputField(
              context,
              AppLocalizations.of(context)!.interestRate,
              '',
              Icons.percent,
            ),
            const SizedBox(
              height: 20,
            ),
            buildInputField(
              context,
              AppLocalizations.of(context)!.duration,
              '',
              Icons.timer,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de pago
              },
              child: Text(AppLocalizations.of(context)!.calculatePayment),
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
