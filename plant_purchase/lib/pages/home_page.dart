import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plant_purchase/models/plant_model.dart';
import 'package:plant_purchase/controllers/tab_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
 final AppTabController appTabController=Get.put(AppTabController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row with icon, title, and more icon
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.eco,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Plant',
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: ' world',
                                style: TextStyle(
                                  color: Colors.green.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          size: 30,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80), // Space for the "My Plants" title

                  // "My Plants" title
                  const Text(
                    'My Plants',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(top: 10),
                      children: [
                        Wrap(
                          spacing: 35,
                          runSpacing: 20,
                          children: [
                            for (int i = 0;
                            i < 20;
                            i++) // Display 20 items as requested
                              PlantDetail(
                                model: PlantModel.plantList[i % 8],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Positioned leaf image on top of everything
              Positioned(
                top: -20,
                right: 25,
                child: Image.asset(
                  "assets/plants/leaf2.png",
                  height: 200,
                ),
              ),

              Positioned(
                  bottom: 20,
                  right: 0,
                  left: 0,
                  child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child:  Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (index) {
                            IconData icon;
                            switch (index) {
                              case 0:
                                icon = FontAwesomeIcons.house;
                                break;
                              case 1:
                                icon = FontAwesomeIcons.noteSticky;
                                break;
                              case 2:
                                icon = FontAwesomeIcons.cartShopping;
                                break;
                              case 3:
                                icon = CupertinoIcons.person_fill;
                                break;
                              default:
                                icon = FontAwesomeIcons.question;
                            }

                            return GestureDetector(
                              onTap: () {
                                appTabController.setTab(index);
                              },
                              child: Icon(
                                icon,
                                size: 20,
                                color: appTabController.selectedTab.value ==
                                    index
                                    ? Colors.white
                                    : Colors.white.withOpacity(.6),
                              ),
                            );
                          }),
                        );
                      }
                      )

                  )),

            ],
          ),
        ),
      ),
    );
  }
}

class PlantDetail extends StatelessWidget {
  final PlantModel model;
  const PlantDetail({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: MediaQuery.of(context).size.width / 2 - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 210,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green.shade400,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                model.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            model.name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '\$${model.price}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}