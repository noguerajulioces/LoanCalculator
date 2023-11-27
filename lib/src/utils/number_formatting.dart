// utils/number_formatting.dart

import 'package:intl/intl.dart';

String formatNumber(double number, {String locale = "es_ES"}) {
  final formatter = NumberFormat("#,##0.00", locale);
  return formatter.format(number);
}
