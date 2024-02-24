import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/pages/checkout.dart';
import 'package:mini_ecommerce_app/pages/home.dart';
import 'package:mini_ecommerce_app/provider/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
