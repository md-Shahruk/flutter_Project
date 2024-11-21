import 'package:coffe_app/controllers/product_animation.dart';
import 'package:coffe_app/controllers/product_page_controller.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:coffe_app/utils/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/animation_controller.dart';

class ProductDetails extends StatelessWidget {
  final Coffee coffe;
  ProductDetails({super.key, required this.coffe});
  final ProductAnimation productAnimation=Get.put(ProductAnimation());

  final ProductPageController productPageController =
      Get.put(ProductPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 110,
              top: 0,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 28,
                                  color: Colors.black,
                                )),
                            Text(
                              "Detail",
                              style: GoogleFonts.sora(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AnimatedBuilder(
                          animation: productAnimation,
                          builder: (context,child)=>
                           FadeTransition(
                            opacity: productAnimation.fadeAnimation,
                            child: SlideTransition(
                              position: productAnimation.slideAnimation,
                              child: Hero(
                                tag: coffe.title,
                                child: Container(
                                  height: 310,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(coffe.imagePath),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          coffe.title,
                          style: GoogleFonts.sora(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ice/Hot",
                              style: GoogleFonts.sora(
                                  fontSize: 20, color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightGray,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/coffee/delivery_bike.png",
                                      height: 40,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightGray,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/coffee/coffee_beans.png",
                                      height: 40,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightGray,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/coffee/coffee_bag.png",
                                      height: 40,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 37,
                            ),
                            Text(
                              "\$${coffe.rating.toStringAsFixed(1)}",
                              style: GoogleFonts.sora(
                                  fontSize: 28,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " (230)",
                              style: GoogleFonts.sora(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Center(
                          child: Container(
                            width: 300, // Set your desired width here
                            child: Divider(
                              thickness:
                                  2, // Set thickness if you want a thicker line
                              color: Colors.grey, // Set color
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                'Coffee is a beloved beverage known for its rich aroma and bold flavors, perfect for energizing mornings and cozy afternoons. ', // Coffee description part
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              color: Colors.grey, // Text color for description
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Read More', // "Read More" part
                                style: GoogleFonts.sora(
                                  fontSize: 18,
                                  color: AppColors
                                      .brown, // Color for "Read More" link
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Size",
                          style: GoogleFonts.sora(
                              fontSize: 27,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(3, (index) {
                            final sizeLabels = ["S", "M", "L"];
                            return GestureDetector(
                              onTap: () =>
                                  productPageController.updateSizeIndex(index),
                              child: Obx(
                                () => AnimatedSwitcher(
                                  duration: Duration(milliseconds: 600),
                                  child: Container(
                                    key: ValueKey<int>(productPageController
                                        .sizeIndex.value),
                                    height: 70,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: productPageController
                                                    .sizeIndex.value ==
                                                index
                                            ? AppColors.brown
                                            : Colors.transparent,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        sizeLabels[index],
                                        style: TextStyle(
                                          fontSize: 35,
                                          color: productPageController
                                                      .sizeIndex.value ==
                                                  index
                                              ? AppColors.brown
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SlideTransition(
                position: productAnimation.buttonAnimation,
                child: Container(
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.white, // Add color if needed
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.grey),
                              ),
                              Text(
                                "\$${coffe.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 28, color: AppColors.brown),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child:  Container(
                              height: 77,
                              decoration: BoxDecoration(
                                color: AppColors.brown,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                  child: Text(
                                "Buy Now",
                                style: GoogleFonts.sora(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        ],
                      ),
                    )),
              ),

            )
          ],
        ));
  }
}
