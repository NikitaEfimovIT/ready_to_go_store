import 'package:ready_to_go_store/models/enums/currency.dart';

class Price {

  Price(this.currency, this.price, this.value);
  Currency currency = Currency.euro;
  double price = 0;
  final double value;


  String toStringAsFixed(int fractionDigits) {
    return price.toStringAsFixed(fractionDigits);
  }

  double toDouble() {
    return value;
  }
}

