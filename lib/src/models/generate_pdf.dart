import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:todo/src/utils/number_formatting.dart';
import 'package:printing/printing.dart';

Future<void> generateAmortizationPdf(
    List<Map<String, dynamic>> amortizationSchedule) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Table.fromTextArray(
          context: context,
          data: <List<String>>[
            <String>['Mes', 'Fecha', 'Capital', 'Interés', 'Balance'],
            ...amortizationSchedule.map((item) {
              try {
                // Convertir a double o usar 0 si la conversión falla
                double principal =
                    double.tryParse(item['principal'].toString()) ?? 0;
                double interest =
                    double.tryParse(item['interest'].toString()) ?? 0;
                double balance =
                    double.tryParse(item['balance'].toString()) ?? 0;

                return [
                  item['month'].toString(),
                  item['paymentDate'].toString(),
                  formatNumber(principal),
                  formatNumber(interest),
                  formatNumber(balance),
                ];
              } catch (e) {
                print('Error al convertir a double: $e');
                return ['Error', 'Error', 'Error', 'Error', 'Error'];
              }
            }),
          ],
        ),
      ],
    ),
  );

  final bytes = await pdf.save();
  await Printing.sharePdf(bytes: bytes, filename: 'amortization_table.pdf');
  // Guardar o compartir el PDF
  // ...
}
