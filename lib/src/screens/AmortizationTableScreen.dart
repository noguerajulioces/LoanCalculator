import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../utils/number_formatting.dart';

class AmortizationTableScreen extends StatelessWidget {
  final double amount;
  final double interestRate;
  final double duration;
  final DateTime startDate;

  const AmortizationTableScreen({
    super.key,
    required this.amount,
    required this.interestRate,
    required this.duration,
    required this.startDate,
  });

  List<Map<String, dynamic>> _calculateAmortizationSchedule() {
    List<Map<String, dynamic>> schedule = [];
    double monthlyInterestRate = interestRate / 12 / 100;
    double balance = amount;
    double monthlyPayment = amount *
        monthlyInterestRate /
        (1 - pow(1 + monthlyInterestRate, -duration));
    DateTime paymentDate = startDate;

    for (int month = 1; month <= duration; month++) {
      double interest = balance * monthlyInterestRate;
      double principal = monthlyPayment - interest;
      balance -= principal;

      schedule.add({
        'month': month,
        'paymentDate': DateFormat('dd/MM/yyyy').format(paymentDate),
        'payment': monthlyPayment,
        'interest': interest,
        'principal': principal,
        'balance': balance > 0 ? balance : 0,
      });

      paymentDate =
          DateTime(paymentDate.year, paymentDate.month + 1, paymentDate.day);
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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: DataTable(
            columnSpacing: 12,
            dataRowMinHeight: 48,
            dataRowMaxHeight: 64,
            headingRowHeight: 40,
            horizontalMargin: 16,
            columns: const [
              DataColumn(label: Text('#')),
              DataColumn(label: Text('Fecha')),
              DataColumn(label: Text('Capital')),
              DataColumn(label: Text('Interés')),
              DataColumn(label: Text('Balance')),
            ],
            rows: amortizationSchedule.map((item) {
              return DataRow(cells: [
                DataCell(Text(item['month'].toString())),
                DataCell(Text(item['paymentDate'].toString())),
                DataCell(Text(formatNumber(item['principal']))),
                DataCell(Text(formatNumber(item['interest']))),
                DataCell(Text(formatNumber(item['balance']))),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
