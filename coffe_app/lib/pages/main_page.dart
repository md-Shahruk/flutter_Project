import 'package:coffe_app/controllers/main_page_controller.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:coffe_app/pages/product_details.dart';
import 'package:coffe_app/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});
  final List<String> coffeeNames = [
    "All Coffee",
    "Espresso",
    "Latte",
    "Cappuccino",
    "Mocha",
    "Americano"
  ];

  final MainPageController mainPageController =Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Stack(
        children: [
          HeadingPartwithSearchbox(),
          OfferPoster(),
          CoffeeNamesTabbar(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 80,
            child: CoffeeListDesign(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70,
              color: AppColors.offWhite,
            ),
          ),
          BottomTabbarDesign(),
        ],
      ),
    );
  }

   Widget BottomTabbarDesign() {
     return Positioned(
       left: 0,
       right: 0,
       bottom: 10,
       child: SizedBox(
         height: 60,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: List.generate(4, (index) {
             final List<IconData> icons = [
               Icons.home_filled,
               Icons.favorite_border_rounded,
               Icons.shopping_bag_outlined,
               Icons.notifications_outlined
             ];
             return GestureDetector(
               onTap: () => mainPageController.updateActiveIndex(index),
               child: Obx(
                     () => Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(
                       icons[index],
                       size: 30,
                       color: mainPageController.activeIndex.value == index
                           ? AppColors.brown
                           : Colors.grey,
                     ),
                     if (mainPageController.activeIndex.value == index)
                       Container(
                         height: 5,
                         width: 20,
                         decoration: BoxDecoration(
                           color: AppColors.brown,
                           borderRadius: BorderRadius.circular(30),
                         ),
                       ),
                   ],
                 ),
               ),
             );
           }),
         ),
       ),
     );
   }


   Widget CoffeeListDesign() {
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 18.0),
       child: Padding(
         padding: const EdgeInsets.only(top: 395.0),
         child: GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: 0.64,
                 mainAxisSpacing: 8.0,
                 crossAxisSpacing: 8.0),
             itemCount: Coffee.coffeeList.length,
             itemBuilder: (context, index) {
               final coffe = Coffee.coffeeList[index];
               return GestureDetector(
                 onTap: () {
                   // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(
                   //     builder: (context) => ProductDetails(coffe: coffe,),
                   //   ),
                   // );

                   Get.to(()=>ProductDetails(coffe: coffe));
                 },
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     color: AppColors.offWhite,
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Stack(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Hero(
                               tag: coffe.title,
                               child: Container(
                                 height: 150,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage(coffe.imagePath),
                                     fit: BoxFit.cover,
                                   ),
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                               ),
                             ),
                           ),
                           Positioned(
                             top: 8,
                             right: 8,
                             child: Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: Container(
                                 padding: EdgeInsets.symmetric(
                                     horizontal: 6, vertical: 4),
                                 decoration: BoxDecoration(
                                   color: Colors.black.withOpacity(0.3),
                                   borderRadius: BorderRadius.circular(12),
                                 ),
                                 child: Row(
                                   children: [
                                     Icon(
                                       Icons.star,
                                       color: Colors.yellow,
                                       size: 16,
                                     ),
                                     SizedBox(width: 4),
                                     Text(
                                       coffe.rating.toString(),
                                       style: GoogleFonts.sora(
                                         fontSize: 14,
                                         color: Colors.white,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       Padding(
                         padding: const EdgeInsets.all(5.0),
                         child: Text(
                           coffe.title,
                           style: GoogleFonts.sora(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                               color: Colors.black),
                         ),
                       ),
                       SizedBox(
                         height: 2,
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 5),
                         child: Text(
                           coffe.subtitle,
                           style: GoogleFonts.sora(
                               fontSize: 13, color: Colors.black),
                         ),
                       ),
                       SizedBox(
                         height: 12,
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 5),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "\$${coffe.price.toStringAsFixed(2)}",
                               style: GoogleFonts.sora(
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black),
                             ),
                             Container(
                               height: 30,
                               width: 30,
                               decoration: BoxDecoration(
                                 color: AppColors.brown,
                                 borderRadius: BorderRadius.circular(5),
                               ),
                               child: Center(
                                 child: Icon(
                                   Icons.add,
                                   color: Colors.white,
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
               );
             }),
       ),
     );
   }

   Widget HeadingPartwithSearchbox() {
     return Container(
       height: 240,
       width: double.infinity,
       color: AppColors.darkGray,
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 18.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(
               height: 25,
             ),
             Text(
               'Locatino',
               style: GoogleFonts.sora(
                   fontSize: 15,
                   color: Colors.white.withOpacity(0.5),
                   letterSpacing: 1.0),
             ),
             SizedBox(
               height: 8,
             ),
             Row(
               children: [
                 Text(
                   "Sylhet, Bangladesh",
                   style: GoogleFonts.sora(
                       fontSize: 20, color: Colors.white.withOpacity(0.7)),
                 ),
                 Icon(
                   Icons.keyboard_arrow_down,
                   size: 22,
                   color: Colors.white,
                 ),
               ],
             ),
             SizedBox(
               height: 20,
             ),
             Row(
               children: [
                 Expanded(
                   child: Container(
                     height: 55,
                     // width: double.infinity,
                     decoration: BoxDecoration(
                       color: Colors.white.withOpacity(0.1),
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: TextField(
                       decoration: InputDecoration(
                         hintText: "Search coffee",
                         hintStyle: GoogleFonts.sora(
                             fontSize: 20, color: Colors.white.withOpacity(0.4)),
                         border: InputBorder.none,
                         prefixIcon: Icon(
                           Icons.search,
                           color: Colors.white,
                           size: 28,
                         ),
                         filled: true,
                         fillColor: Colors.transparent,
                         contentPadding: EdgeInsets.symmetric(
                             vertical: 16.0, horizontal: 16.0),
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 15,
                 ),
                 Container(
                   height: 55,
                   width: 50,
                   decoration: BoxDecoration(
                       color: AppColors.brown,
                       borderRadius: BorderRadius.circular(15)),
                   child: Align(
                     alignment: Alignment.center,
                     child: Icon(
                       Icons.dashboard_outlined,
                       color: Colors.white,
                     ),
                   ),
                 )
               ],
             ),
           ],
         ),
       ),
     );
   }

   // Need implement here getx
   Widget CoffeeNamesTabbar() {
     return Padding(
       padding: const EdgeInsets.only(top: 320),
       child: Column(
         children: [
           const SizedBox(height: 15),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 18.0),
             child: Container(
               height: 65,
               padding: EdgeInsets.symmetric(vertical: 10.0),
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: coffeeNames.length,
                 itemBuilder: (context, index) {
                   return GestureDetector(
                     onTap: () => mainPageController.updateIndex(index),
                     child: Obx(
                           () {
                         final isSelected =
                             index == mainPageController.selectIndex.value;
                         return Container(
                           padding: EdgeInsets.symmetric(
                               horizontal: 15, vertical: 5),
                           decoration: BoxDecoration(
                             color: isSelected
                                 ? AppColors.brown
                                 : AppColors.lightGray,
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child: Center(
                             child: Text(
                               coffeeNames[index],
                               style: GoogleFonts.sora(
                                 fontSize: 20,
                                 color: isSelected
                                     ? Colors.white
                                     : Colors.black.withOpacity(0.7),
                                 fontWeight: isSelected
                                     ? FontWeight.bold
                                     : FontWeight.normal,
                               ),
                             ),
                           ),
                         );
                       },
                     ),
                   );
                 },
               ),
             ),
           ),
         ],
       ),
     );
   }


   Widget OfferPoster() {
     return Padding(
       padding: const EdgeInsets.only(bottom: 240),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 18.0),
             child: Container(
               height: 130,
               //width: double.infinity,
               decoration: BoxDecoration(
                 color: Color.fromRGBO(148, 114, 87, 1.0),
                 borderRadius: BorderRadius.circular(15),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text(
                     "Buy One get\none FREE",
                     style: GoogleFonts.sora(
                       fontSize: 30,
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       shadows: [
                         Shadow(
                           color: Colors.black.withOpacity(0.5), // Shadow color
                           offset: Offset(
                               3.0, 3.0), // Shadow offset (horizontal, vertical)
                           blurRadius: 6.0, // Shadow blur effect
                         ),
                       ],
                     ),
                   ),
                   CircleAvatar(
                     radius: 50.0, // Set the radius of the circle
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(
                           60.0), // Match the circle radius
                       child: Image.asset(
                         "assets/coffee/coffe_3.png",
                         fit: BoxFit
                             .cover, // Ensures the image covers the area of the circle
                       ),
                     ),
                   )
                 ],
               ),
             ),
           )
         ],
       ),
     );
   }
}

