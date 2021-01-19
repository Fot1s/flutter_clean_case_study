import 'package:intl/intl.dart';

class Utils {

  static String formatCurrency(int cents) {
    return   NumberFormat.simpleCurrency(locale: 'eu').format(cents/100) ;

  }

}