import 'package:ready_to_go_store/models/enums/currency.dart';

class Price{
  Price(this.currency, this.price);
  Currency currency = Currency.euro;
  double price = 0;
}