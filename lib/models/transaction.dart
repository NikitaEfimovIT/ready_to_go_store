import 'payer.dart';
import 'package:uuid/v4.dart';

import 'order.dart';

enum TransactionStatus{
  preparing, awaitingPayment, pending, successful, failed, canceled
}

enum PaymentMethod{
  none, cardPayment, mobilePayment
}

class Transaction {
  late String transactionId;
  late DateTime transactionDate;
  late Order order;
  late PaymentMethod paymentMethod;
  late TransactionStatus status;
  late Payer payer;
  late String description;
  late String paymentProvider;
  late String errorDetails;

  Transaction() {
    status = TransactionStatus.preparing;
    paymentMethod = PaymentMethod.none;
    transactionId = const UuidV4().toString();
    transactionDate = DateTime.timestamp();
    payer = Payer();
    description = "";
    paymentProvider = "";
    errorDetails = "";
  }

  set uploadOrderInfo(Order customerOrder){
    order = customerOrder;
  }

  set setErrorDetails(String val) {
    errorDetails = val;
  }
}
