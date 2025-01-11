import 'package:flutter/material.dart';

import '../models/payer.dart';

class PayerForm extends StatefulWidget {
  const PayerForm({super.key, required this.p});

  final Payer p;

  @override
  State<StatefulWidget> createState() => _PayerFormState(payer: p);
}

class _PayerFormState extends State<PayerForm> {
  _PayerFormState({required this.payer});

  Payer payer;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                    0, 45.0, 0, 2
                ),
                labelText: 'Name*',
                errorStyle: TextStyle(fontSize: 18.0),
                // border: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red),
                //     borderRadius:
                //     BorderRadius.all(Radius.circular(9.0))),
              ),
              onChanged: (String? value) {
                _formKey.currentState!.validate();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                    0, 45.0, 0, 2
                ),
                labelText: 'Last name*',
                errorStyle: TextStyle(fontSize: 18.0),
                // border: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red),
                //     borderRadius:
                //     BorderRadius.all(Radius.circular(9.0))),
              ),
              onChanged: (String? value) {
                _formKey.currentState!.validate();

              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                    0, 45.0, 0, 2
                ),
                labelText: 'Country*',
                errorStyle: TextStyle(fontSize: 18.0),
                // border: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red),
                //     borderRadius:
                //     BorderRadius.all(Radius.circular(9.0))),
              ),
              onChanged: (String? value) {
                _formKey.currentState!.validate();

              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                    0, 45.0, 0, 2
                ),
                labelText: 'Address*',
                errorStyle: TextStyle(fontSize: 18.0),
                // border: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red),
                //     borderRadius:
                //     BorderRadius.all(Radius.circular(9.0))),
              ),
              onChanged: (String? value) {
                _formKey.currentState!.validate();

              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                    0, 45.0, 0, 2
                ),
                labelText: 'ZIP*',
                errorStyle: TextStyle(fontSize: 18.0),
                // border: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.red),
                //     borderRadius:
                //     BorderRadius.all(Radius.circular(9.0))),
              ),
              onChanged: (String? value) {
                _formKey.currentState!.validate();

              },
            )
          ]),
    );
  }
}
