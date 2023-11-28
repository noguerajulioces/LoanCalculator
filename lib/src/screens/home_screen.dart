import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/models/loan_calculator.dart';
import 'package:todo/src/screens/AmortizationTableScreen.dart';
import 'package:todo/src/utils/number_formatting.dart';

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
  final LoanCalculator _calculator = LoanCalculator();

  @override
  void dispose() {
    _amountController.dispose();
    _interestRateController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void calculateAndShowLoanDetails() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    double interestRate = double.tryParse(_interestRateController.text) ?? 0;
    int duration = int.tryParse(_durationController.text) ?? 0;

    double monthlyPayment =
        _calculator.calculateMonthlyPayment(amount, interestRate, duration);
    double totalPayment =
        _calculator.calculateTotalPayment(monthlyPayment, duration);
    double totalInterest =
        _calculator.calculateTotalInterest(totalPayment, amount);

    String monthlyPaymentStr = formatNumber(monthlyPayment);
    String totalPaymentStr = formatNumber(totalPayment);
    String totalInterestStr = formatNumber(totalInterest);

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
                      startDate: DateTime.now(),
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
              onPressed: calculateAndShowLoanDetails,
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
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
    );
  }
}
