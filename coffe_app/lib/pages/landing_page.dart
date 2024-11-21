import 'package:coffe_app/controllers/animation_controller.dart';
import 'package:coffe_app/pages/main_page.dart';
import 'package:coffe_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  final AnimationDesign animationDesign = Get.put(AnimationDesign());
   LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      body: Stack(
        children: [
          // Background image
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/coffee/landingpage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),


          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [

                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.9),
                ],
                stops: const [0.6, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

              ),
            ),
          ),

          // Text and button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ScaleTransition(

                  scale: animationDesign.textAnimation,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Fall in Love with\n",
                          style: GoogleFonts.sora(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Coffee is Blissful\n",
                          style: GoogleFonts.sora(
                            fontSize: 37,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Delight!",
                          style: GoogleFonts.sora(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MainPage(),
                    //   ),
                    // );
                    Get.to(()=> MainPage());
                  },
                  child: SlideTransition(
                    position: animationDesign.buttonAnimation,
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.brown,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.sora(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
