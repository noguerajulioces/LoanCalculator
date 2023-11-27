import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:todo/src/screens/AmortizationTableScreen.dart';

String getLocalCurrencySymbol() {
  var format = NumberFormat.simpleCurrency(locale: Intl.systemLocale);
  return format.currencySymbol;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _interestRateController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _calculateLoan() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    double interestRate = double.tryParse(_interestRateController.text) ?? 0;
    double duration = double.tryParse(_durationController.text) ?? 0;

    double monthlyInterestRate = interestRate / 12 / 100;
    double monthlyPayment = 0;

    if (monthlyInterestRate > 0) {
      monthlyPayment = amount *
          monthlyInterestRate /
          (1 - pow(1 + monthlyInterestRate, -duration));
    } else {
      monthlyPayment = amount / duration;
    }

    double totalPayment = monthlyPayment * duration;
    double totalInterest = totalPayment - amount;

    final formatter = NumberFormat(
        "#,##0.00", "es_ES"); // Cambia "es_ES" por tu locale si es necesario

    String monthlyPaymentStr = formatter.format(monthlyPayment);
    String totalPaymentStr = formatter.format(totalPayment);
    String totalInterestStr = formatter.format(totalInterest);

    _showLoanDetailsDialog(
        monthlyPaymentStr, totalPaymentStr, totalInterestStr);
  }

  void _showLoanDetailsDialog(
      String monthlyPayment, String totalPayment, String totalInterest) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalles del Préstamo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Pago Mensual: $monthlyPayment'),
                Text('Total a pagar: $totalPayment'),
                Text('Total de interés: $totalInterest')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Mostrar Tabla de Amortización'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AmortizationTableScreen(
                      amount: double.tryParse(_amountController.text) ?? 0,
                      interestRate:
                          double.tryParse(_interestRateController.text) ?? 0,
                      duration: double.tryParse(_durationController.text) ?? 0,
                    ),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text('Guardar Préstamo'),
              onPressed: () {
                // Acción para guardar el préstamo
              },
            ),
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
          ],
        );
      },
    );
  }

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
              _amountController,
            ),
            const SizedBox(height: 20),
            buildInputField(
              context,
              AppLocalizations.of(context)!.interestRate,
              '',
              Icons.percent,
              _interestRateController,
            ),
            const SizedBox(height: 20),
            buildInputField(
              context,
              AppLocalizations.of(context)!.duration,
              '',
              Icons.timer,
              _durationController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateLoan,
              child: Text(AppLocalizations.of(context)!.calculatePayment),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(
    BuildContext context,
    String label,
    String coinSymbol,
    IconData icon,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        prefixText: coinSymbol,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
    );
  }
}
