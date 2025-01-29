import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/order_overview/order_overview_modal_sheet_item_list.dart';
import 'package:ready_to_go_store/regular_top_bar/top_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'cart_components/cart_list.dart';
import 'cart_provider.dart';
import 'models/item.dart';
import 'order_overview/order_overview_modal_sheet.dart';


class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration _remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = Duration(hours: 3);
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        if (_remainingTime > Duration.zero) {
          _remainingTime -= Duration(minutes: 1);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTimeInWords() {
    int hours = _remainingTime.inHours;
    int minutes = _remainingTime.inMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return "$hours hours $minutes minutes";
    } else if (hours > 0) {
      return "$hours hours";
    } else if (minutes > 0) {
      return "$minutes minutes";
    } else {
      return "Time's up";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTimeInWords(),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: Colors.red),
    );
  }
}




class OrderCollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider order, Widget? child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TopBar(),
                    SizedBox(height: 20),
                    const Text(
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 73, 8),
                          fontWeight: FontWeight.w700,
                          fontSize: 26),
                      "Take Your Items!",
                    ),
                    SizedBox(height: 10),
                    const Text(
                      "Go to the locker and scan this code to get your order",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QrImageView(
                          data: '1234567890',
                          version: QrVersions.auto,
                          size: 280.0,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Valid: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                        CountdownTimer(),
                      ],
                    ),
                    SizedBox(height: 20),
                    const Padding(padding: EdgeInsets.only(left:20, right: 20),
                      child:
                      Text("*When you pick up your order, you will automatically redirected to the home page",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),),),
                    SizedBox(height: 20),

                    Padding(  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 73, 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Set border radius to 5px
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height * 0.4,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Order Overview",
                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      OrderOverviewItemsList(),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Order Review",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

