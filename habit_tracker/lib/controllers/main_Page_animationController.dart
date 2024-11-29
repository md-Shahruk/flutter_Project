import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainPageAnimationcontroller extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimationLeftToRight;
  late Animation<Offset> slideAnimationRightToLeft;
  late Animation<double> scaleAnimation;
  bool isAnimating = false;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Slide animation from right to left
    slideAnimationRightToLeft = Tween<Offset>(
      begin: const Offset(-0.5, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,

    ));

    // Slide animation from left to right
    slideAnimationLeftToRight = Tween<Offset>(
      begin: const Offset(0.5, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,

    ));


    scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,

    ));


    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isAnimating = false;
      } else if (status == AnimationStatus.dismissed) {
        isAnimating = false; // Reset the flag when animation is dismissed
      }
    });
  }




  void startAnimation() {
    if (!isAnimating && animationController.status != AnimationStatus.completed) {
      isAnimating = true;
      animationController.forward();
    }
  }


  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
