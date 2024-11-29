import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/controllers/landingPageController.dart';
import 'package:habit_tracker/models/forLandingPage.dart';

import 'package:habit_tracker/widgets/showhabit.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});


  final Landingpagecontroller landingpagecontroller=Get.find<Landingpagecontroller>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        //backgroundColor: Colors.amber,

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: height * 0.03,
            vertical: width * 0.1,
          ),
          child: Stack(
            children: [
              ListView(

                children: [
                  Text(
                    "Choose habit",
                    style: GoogleFonts.openSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Choose your daily habits, you can choose\nmore than one.",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.grey.withOpacity(0.9),
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  AnimationLimiter(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 4.5 / 3.6,
                      ),
                      itemCount: Habit.habits.length,
                      itemBuilder: (context, index) {
                        final habit = Habit.habits[index];

                        return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            duration: const Duration(milliseconds: 1200),
                            curve: Curves.fastOutSlowIn,

                            child: ScaleAnimation(
                              duration: const Duration(milliseconds: 1200),
                              curve: Curves.fastOutSlowIn,

                              child: Obx(() {
                                final isSelected = landingpagecontroller
                                    .selectIndicis
                                    .contains(index);
                                return Showhabit(
                                  title: habit.title,
                                  image: habit.imagePath,
                                  isSelect: isSelected,
                                  onTap: () {
                                    landingpagecontroller
                                        .toggleSelection(index);
                                  },
                                );
                              }),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: landingpagecontroller.selectIndicis.isNotEmpty
                        ? GestureDetector(
                            key: const ValueKey("button"),
                            onTap: () {
                            Get.toNamed('/customnavbar');
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF222222),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Get Started!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(
                            key: ValueKey("empty"),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
