import 'package:flutter/material.dart';
import 'package:ready_to_go_store/regular_top_bar/top_bar.dart';
import 'checkout_components/payer_form.dart';
import 'checkout_components/payment_option.dart';
import 'models/transaction.dart';
import 'order_collection_screen.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<StatefulWidget> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late Transaction transaction;

  _CheckoutState() {
    transaction = Transaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          title: const Padding(
              padding: EdgeInsets.only(left: 2, right: 2), child: TopBar()),
          scrolledUnderElevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(13.0, 0, 13, 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 73, 8),
                              fontWeight: FontWeight.w600,
                              fontSize: 30),
                          "Payment information"),
                      PayerForm(p: transaction.payer),
                    ]),
                Column(children: [
                  const PaymentOption(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 73, 8),
                        ),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OrderCollectionScreen())),
                        child: const Text("Make a payment",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 73, 8),
                              )),
                              onPressed: () => {Navigator.pop(context)},
                              child: const Text("Cancel")),
                          OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 73, 8),
                              )),
                              onPressed: () => {
                                    Navigator.of(context)
                                        .pushReplacementNamed("/cart")
                                  },
                              child: const Text("Change items"))
                        ],
                      )
                    ],
                  )
                ])
              ],
            )));
  }
}
