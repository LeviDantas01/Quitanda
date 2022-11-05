import 'package:intl/intl.dart';

class UtilServices {
  String priceToCourence(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }
}
