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

    double yearlyInterest = 0;
    double yearlyPrincipal = 0;

    for (int month = 1; month <= duration; month++) {
      double interest = balance * monthlyInterestRate;
      double principal = monthlyPayment - interest;
      balance -= principal;

      yearlyInterest += interest;
      yearlyPrincipal += principal;

      schedule.add({
        'month': month,
        'paymentDate': DateFormat('dd/MM/yyyy').format(paymentDate),
        'payment': monthlyPayment,
        'interest': interest,
        'principal': principal,
        'balance': balance > 0 ? balance : 0,
      });

      if (month % 12 == 0) {
        schedule.add({
          'month': 'Año ${month ~/ 12}',
          'paymentDate': '',
          'payment': '',
          'interest': yearlyInterest,
          'principal': yearlyPrincipal,
          'balance': '',
          'isYearlyTotal': true, // Indicador de fila de total anual
        });

        // Restablecer totales anuales
        yearlyInterest = 0;
        yearlyPrincipal = 0;
      }

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
        actions: <Widget>[
          TextButton(
            onPressed: () {
              print("hola");
            },
            child: Text('Exportar'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: DataTable(
            columnSpacing: 6,
            dataRowMinHeight: 48,
            dataRowMaxHeight: 64,
            headingRowHeight: 40,
            horizontalMargin: 20,
            columns: const [
              DataColumn(label: Center(child: Text('#'))),
              DataColumn(label: Center(child: Text('Fecha'))),
              DataColumn(label: Center(child: Text('Capital'))),
              DataColumn(label: Center(child: Text('Interés'))),
              DataColumn(label: Center(child: Text('Balance'))),
            ],
            rows: amortizationSchedule.map((item) {
              if (item.containsKey('isYearlyTotal')) {
                return DataRow(
                    color:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                    cells: [
                      const DataCell(Text('')),
                      DataCell(Text(
                        "${item['month'].toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                      DataCell(
                        Text(
                          formatNumber(item['principal']),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          formatNumber(item['interest']),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const DataCell(Text('')),
                    ]);
              } else {
                return DataRow(cells: [
                  DataCell(Text(item['month'].toString())),
                  DataCell(Text(item['paymentDate'].toString())),
                  DataCell(Text(formatNumber(item['principal']))),
                  DataCell(Text(formatNumber(item['interest']))),
                  DataCell(Text(formatNumber(item['balance']))),
                ]);
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}
