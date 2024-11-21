
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationDesign extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> buttonAnimation;
  late Animation<double> textAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    buttonAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));

    // Adding a slight delay to ensure widget tree is ready before starting animation
    animationController.forward();
  }


}