import 'package:uuid/v4.dart';

class Payer{
  String firstName = "";
  String lastName = "";
  String country = "";
  String address = "";
  String zip = "";
  String transactionId = "";
  Payer(){
    transactionId = const UuidV4().toString();
  }

   set setFirstName(String val){
      firstName = val;
   }
   set setLastName(String val){
    lastName = val;
   }
  set setCountry(String val){
    country = val;
  }
  set setAddress(String val){
    address = val;
  }
  set setZip(String val){
    zip = val;
  }
}