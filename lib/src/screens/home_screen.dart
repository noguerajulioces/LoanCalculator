import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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

  String _result = '';

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

    double total = amount * (1 + (interestRate / 100) * duration);

    setState(() {
      _result = 'Total a pagar: $total';
    });
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
            const SizedBox(height: 20),
            Text(_result),
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
