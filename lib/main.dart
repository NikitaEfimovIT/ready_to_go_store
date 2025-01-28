import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/home_page.dart';
import 'package:ready_to_go_store/models/app_state.dart';

import 'cart_provider.dart';
import 'auth_components/login.dart';
import 'auth_components/signup.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppState()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
            primary: Colors.black,
            secondary: const Color.fromARGB(255, 255, 73, 8),
            surface: Colors.white),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
