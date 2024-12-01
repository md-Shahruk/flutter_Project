
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDesign extends StatefulWidget {
  const ProductDesign({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.imageKey,
  });

  final String title;
  final String subtitle;
  final int price;
  final String image;
  final GlobalKey imageKey;

  @override
  State<ProductDesign> createState() => _ProductDesignState();
}

class _ProductDesignState extends State<ProductDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // The container is the base
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: const Color(0XFFF8F6F7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Text(
                widget.title,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                widget.subtitle,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "৳${widget.price}",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color(0xFFE3052E),
                ),
              ),
            ],
          ),
        ),

        // Animated Image
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {

            double animatatTop = -120 + (80 * animation.value);
            return Positioned(
              top: animatatTop,
              left: 30, // Adjust as needed for centering
              right: 30,
              child: Center(
                child: Image.asset(
                  widget.image,
                  key: widget.imageKey,
                  height: 85,
                  width: 120,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
