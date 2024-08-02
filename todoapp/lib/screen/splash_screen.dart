import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:todoapp/screen/task_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 6),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const TaskScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(250, 242, 234, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/todo1.gif"),
            Text(
              "Boost your productivity.",
              style: GoogleFonts.robotoMono(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 28,
              width: 28,
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation(Color.fromARGB(255, 240, 202, 144)),
                strokeWidth: 3.0,
                backgroundColor: Color.fromARGB(255, 239, 105, 95),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
