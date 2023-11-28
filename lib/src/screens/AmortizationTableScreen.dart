import 'package:flutter/material.dart';
import 'dart:math';

class AmortizationTableScreen extends StatelessWidget {
  final double amount;
  final double interestRate;
  final double duration;

  const AmortizationTableScreen({
    super.key,
    required this.amount,
    required this.interestRate,
    required this.duration,
  });

  List<Map<String, dynamic>> _calculateAmortizationSchedule() {
    List<Map<String, dynamic>> schedule = [];
    double monthlyInterestRate = interestRate / 12 / 100;
    double balance = amount;
    double monthlyPayment = amount *
        monthlyInterestRate /
        (1 - pow(1 + monthlyInterestRate, -duration));

    for (int month = 1; month <= duration; month++) {
      double interest = balance * monthlyInterestRate;
      double principal = monthlyPayment - interest;
      balance -= principal;

      schedule.add({
        'month': month,
        'payment': monthlyPayment,
        'interest': interest,
        'principal': principal,
        'balance': balance > 0 ? balance : 0,
      });
    }

    return schedule;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> amortizationSchedule =
        _calculateAmortizationSchedule();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla de Amortización'),
      ),
      body: ListView.separated(
        itemCount: amortizationSchedule.length,
        itemBuilder: (context, index) {
          var item = amortizationSchedule[index];
          return ListTile(
            title: Text('Mes ${item['month']}'),
            subtitle: Text(
                'Pago: ${item['payment'].toStringAsFixed(2)}, Interés: ${item['interest'].toStringAsFixed(2)}, Principal: ${item['principal'].toStringAsFixed(2)}, Balance: ${item['balance'].toStringAsFixed(2)}'),
            leading: const Icon(Icons.read_more_outlined),
            trailing: const Icon(Icons.abc),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
