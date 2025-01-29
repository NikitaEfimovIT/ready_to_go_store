import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/home_page.dart';
import 'package:ready_to_go_store/models/app_state.dart';
import 'package:ready_to_go_store/cart_provider.dart';
import 'package:ready_to_go_store/auth_components/login.dart';
import 'package:ready_to_go_store/auth_components/signup.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.black,
          secondary: const Color.fromARGB(255, 255, 73, 8),
          surface: Colors.white,
        ),
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
