
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:habit_tracker/controllers/main_Page_animationController.dart';
import 'package:habit_tracker/controllers/main_page_controller.dart';
import 'package:habit_tracker/models/day_date_model.dart';
import 'package:habit_tracker/models/forLandingPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    final MainPageController mainPageController = Get.find<MainPageController>();
    final MainPageAnimationcontroller mainPageAnimationcontroller=Get.find<MainPageAnimationcontroller>();


    mainPageAnimationcontroller.startAnimation();


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.058, right: width * 0.05, left: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header view
                SlideTransition(
                  position:mainPageAnimationcontroller.slideAnimationLeftToRight ,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                       // height: height * 0.065,
                        //width: width * 0.13,
                        height: 50,width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                              width: 2,
                            )),
                        child: Center(
                          child: Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: width * 0.07,
                          ),
                        ),
                      ),
                      Text(
                        "Wednesday, 24",
                        style: TextStyle(
                            fontSize: width * 0.053,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.9)),
                      ),
                      Container(
                        // height: height * 0.065,
                        // width: width * 0.13,
                        height: 50,width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                              width: 2,
                            )),
                        child: Center(
                          child: Icon(Icons.calendar_month_outlined,
                              color: Colors.black, size: width * 0.07),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                //Notifiacations box
                SlideTransition(
                  position: mainPageAnimationcontroller.slideAnimationRightToLeft,
                  child: Container(
                    height: height * 0.16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF222222),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(height * 0.028),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            color: const Color(0xFF464649),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/habit/book.png",
                              height: 65,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Notification!',
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontSize: width * 0.042,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Now is the time to read the book, you can change it in settings.',
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.03,
                ),
                //First Listview
                ScaleTransition(
                  scale: mainPageAnimationcontroller.scaleAnimation,
                  child: SizedBox(
                    height: height * 0.165,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: DayDateModel.getDayDateList.length,
                      itemBuilder: (context, index) {
                        final date = DayDateModel.getDayDateList[index];
                        return GestureDetector(
                            onTap: () {
                              mainPageController.selectDate(index);
                            },
                            child: Obx(
                              () => Container(
                                margin: const EdgeInsets.all(10),
                                //height: height*0.05,
                                width: width * 0.18,
                                decoration: BoxDecoration(
                                    color: mainPageController.selectIndex.value ==
                                            index
                                        ? const Color(0xFFFD5B32)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.grey.withOpacity(0.4),
                                    )),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        date.title,
                                        style: TextStyle(
                                            fontSize: width * 0.06,
                                            color: mainPageController
                                                        .selectIndex.value ==
                                                    index
                                                ? Colors.white
                                                : Colors.grey),
                                      ),
                                      Text(
                                        date.date,
                                        style: TextStyle(
                                            fontSize: width * 0.06,
                                            color: mainPageController
                                                        .selectIndex.value ==
                                                    index
                                                ? Colors.white
                                                : Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.03,
                ),
                //Text view
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tuesday habit",style: TextStyle(fontSize: width*0.06,color: Colors.black,fontWeight: FontWeight.bold),),
                    Text("See all",style: TextStyle(fontSize: width*0.04,letterSpacing: 1, color: Colors.black.withOpacity(0.5),fontWeight: FontWeight.bold),),
                  ],
                ),

                SizedBox(height: height*0.01,),
                //Grid view
                ScaleTransition(
                  scale: mainPageAnimationcontroller.scaleAnimation,
                  child: GridView.builder(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: Habit.habits.length,
                      itemBuilder: (context,index){
                      final detail=Habit.habits[index];
                      return Container(
                        height: height*0.3,
                        width: width*0.5,
                        decoration: BoxDecoration(
                          color: detail.color,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: height*0.03,
                                left: width*0.03,
                                child: Image.asset(detail.imagePath, height: height*0.1,width: width*0.2,)),

                            Positioned(
                              top: height*0.028,
                                right: width*0.03,
                                child: Container(
                                  height: 40,width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: const Center(child: Icon(Icons.check,color: Colors.green,),),
                                )),

                            Positioned(
                              top: height*0.19,
                                left: width*0.05,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(detail.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: width*0.045),),
                                Text(detail.subtitle,style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: width*0.04),),
                              ],
                            ))
                          ],
                        ),
                      );
                      }),
                ),
                SizedBox(height: height*0.1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
