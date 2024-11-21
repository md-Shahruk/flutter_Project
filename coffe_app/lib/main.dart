import 'package:coffe_app/pages/landing_page.dart';
import 'package:coffe_app/pages/main_page.dart';
import 'package:coffe_app/pages/practice.dart';
import 'package:coffe_app/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
       //home: MainPage(),
      //home: ProductDetails(),
    );
  }
}
