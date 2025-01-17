import 'package:flutter/material.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<StatefulWidget> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  _PaymentOptionState();

  num selectedOption = 0;

  void setSelectOption(num buttonId) {
    setState(() {
      if (selectedOption != buttonId) {
        selectedOption = buttonId;
      } else {
        selectedOption = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              textStyle: TextStyle(color: ThemeData().colorScheme.primary, fontSize: 15),
              side: BorderSide(
                  width: selectedOption == 1 ? 1 : 0.5,
                  color: selectedOption == 1
                      ? const Color.fromARGB(255, 255, 73, 8)
                      : ThemeData().colorScheme.primary),
            ),
            onPressed: () => setSelectOption(1),
            child: const Text("Credit / Debit card")),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              textStyle: TextStyle(color: ThemeData().colorScheme.primary, fontSize: 15),
              side: BorderSide(
                  width: selectedOption == 2 ? 1 : 0.5,
                  color: selectedOption == 2
                      ? const Color.fromARGB(255, 255, 73, 8)
                      : ThemeData().colorScheme.primary),
            ),
            onPressed: () => setSelectOption(2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Image.asset("lib/assets/google.png", width: 60, height: 20,),
              const Text("/"),
              Image.asset("lib/assets/apple.png", width: 60, height: 20,),

            ])),
      ],
    );
  }
}
