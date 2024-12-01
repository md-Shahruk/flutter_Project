import 'package:flutter/material.dart';
import 'package:kfc_app/pages/checkout_page.dart';

import 'package:kfc_app/pages/home_page.dart';
import 'package:kfc_app/widgets/product_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home: HomePage(),



    );
  }
}
