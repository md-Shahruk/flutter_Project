import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kfc_app/models/home_model.dart';
import 'package:kfc_app/pages/checkout_page.dart';
import 'package:kfc_app/widgets/product_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late bool isSelect;
  //For product to cart animation
  final GlobalKey cartkey = GlobalKey();
  late AnimationController animationController;
  late Animation<Offset> positionAnimation;
  late OverlayEntry overlayEntry;

  void flyToCart(GlobalKey productKey, String imagePath) {
    final startProductRender =
        productKey.currentContext!.findRenderObject() as RenderBox;
    final productPosition = startProductRender.localToGlobal(Offset.zero);

    final stratCartRender =
        cartkey.currentContext!.findRenderObject() as RenderBox;
    final cartPosition = stratCartRender.localToGlobal(Offset.zero);

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    positionAnimation = Tween<Offset>(
      begin: Offset(productPosition.dx, productPosition.dy),
      end: Offset(cartPosition.dx, cartPosition.dy),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    overlayEntry = OverlayEntry(builder: (context) {
      return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Positioned(
              left: positionAnimation.value.dx,
              top: positionAnimation.value.dy,
              child: child!);
        },
        child: Image.asset(
          imagePath,
          height: 40,
          width: 40,
        ),
      );
    });

    Overlay.of(context).insert(overlayEntry);

    animationController.forward().then((value) {
      overlayEntry.remove();
      animationController.dispose();
    });
  }

  int navSelect = 0;

  //Functionality

  List<MenuItem> checkout = [];

  void goToCheckout(MenuItem menu, GlobalKey productKey) {
    setState(() {
      checkout.add(menu);
    });
    flyToCart(productKey, menu.imagePath);
  }

  final List<String> options = ["Single", "Combo", "Bucket"];
  @override
  Widget build(BuildContext context) {
    final appsize = MediaQuery.sizeOf(context);
    final height = appsize.height * 1;
    final width = appsize.width * 1;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.06, left: width * 0.05, right: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Header Design
                Row(
                  children: [
                    Image.asset(
                      "assets/kfc/menu.png",
                      height: 65,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nearby Outlet",
                            style: GoogleFonts.lato(
                                fontSize: width * 0.045,
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Zindabazar, Sylhet",
                            style: GoogleFonts.lato(
                                fontSize: width * 0.05,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckoutPage(
                                          product: checkout,
                                        )));
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            size: 40,
                            color: Colors.black,
                            key: cartkey,
                          ),
                        ),
                        if (checkout.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${checkout.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),

                //first navbar
                GivenHeight(height * 0.05),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(options.length, (index) {
                        final isSelect = navSelect == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              navSelect = index;
                            });
                          },
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) {
                              return isSelect
                                  ? ScaleTransition(
                                      scale: Tween<double>(
                                        begin: 0.6, // Starts from invisible
                                        end: 1.0, // Zooms to full size
                                      ).animate(animation),
                                      child: FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                    )
                                  : child;
                            },
                            child: Container(
                              key: ValueKey<int>(isSelect ? navSelect : 0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: navSelect == index
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                //key: ValueKey<int>(navSelect),
                                options[index],
                                style: TextStyle(
                                  color: navSelect == index
                                      ? Colors.black
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05,
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                ),

                //Header Box
                GivenHeight(height * 0.05),
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF5EF),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "TUESDAY DEAL",
                                style: GoogleFonts.roboto(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFE3052E)),
                              ),
                              Text(
                                "20pcs Chicken\nBucket",
                                style: GoogleFonts.roboto(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              GivenHeight(height * 0.01),
                              Text(
                                "9AM - 10PM",
                                style: GoogleFonts.roboto(
                                    fontSize: width * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/kfc/banner.png",
                          height: 140,
                        ),
                      ],
                    ),
                  ),
                ),

                GivenHeight(height * 0.08),
                //Grid content
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 65,
                    // childAspectRatio: 0.002,
                  ),
                  itemCount: MenuItem.menuItems.length,
                  itemBuilder: (context, index) {
                    final menu = MenuItem.menuItems[index];
                    final productKey = GlobalKey();
                    return GestureDetector(
                      onTap: () => goToCheckout(menu, productKey),
                      child: ProductDesign(
                        imageKey: productKey,
                        title: menu.title,
                        subtitle: menu.subtitle,
                        price: menu.price,
                        image: menu.imagePath,
                      ),
                    );
                  },
                ),

                GivenHeight(height * 0.08),
              ],
            ),
          ),
        ));
  }

  SizedBox GivenHeight(double height) {
    return SizedBox(
      height: height,
    );
  }
}
