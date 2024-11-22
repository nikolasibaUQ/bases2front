import 'package:intl/intl.dart';

class Utils {
  static String getFormattedCurrency(double amount) {
    final formatter = NumberFormat(
      '#,##0.00',
      'es_CO',
    );
    return formatter.format(amount);
  }
}
