import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kfc_app/models/home_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.product});
  final List<MenuItem> product;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with SingleTickerProviderStateMixin {
  //final model =MenuItem.menuItems;
  late List<double> scales;

  @override
  late List<int> quantities;

  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(widget.product.length, 1);

    scales = List<double>.filled(widget.product.length, 0.2);

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        scales = List<double>.filled(widget.product.length, 1.0);
      });
    });
  }

  double calculateTotal() {
    double total = 0.0;
    for (int i = 0; i < widget.product.length; i++) {
      total += widget.product[i].price * quantities[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final appsize = MediaQuery.sizeOf(context);
    final height = appsize.height * 1;
    final width = appsize.width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: height * 0.06,
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                CartHeader(),
                const SizedBox(height: 25),
                ...ItemList(),
                const SizedBox(
                    height: 100), // Space to avoid overlap with Positioned
              ],
            ),
            Positioned(
              bottom: 0, // Fixed to the bottom of the scrollable content
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3052E),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Continue to Checkout",
                      style: GoogleFonts.roboto(
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
    );
  }

  Widget CartHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your Cart",
          style: GoogleFonts.roboto(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Row(
          children: [
            Text(
              "Total:",
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 500),
              tween: Tween<double>(
                begin: 0.0,
                end: calculateTotal(),
              ),
              builder: (context, value, child) {
                return Text(
                  "৳${value.toStringAsFixed(2)}",
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE3052E),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }

  List<Widget> ItemList() {
    return List<Widget>.generate(widget.product.length, (index) {
      final item = widget.product[index];
      return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0XFFF8F6F7),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${quantities[index]} x ', // The number
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: item.title, // The description
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            item.secondTitle,
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Row(
                            children: [
                              Text(
                                "৳${(item.price * quantities[index]).toStringAsFixed(2)}",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFE3052E)),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              // increment decrement area
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 30, width: 30,

                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    //padding: EdgeInsets.all(1),
                                    child: Center(
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                quantities[index]++;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.red,
                                              size: 30,
                                            ))),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${quantities[index]}', // The number
                                    style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30, width: 30,

                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    //padding: EdgeInsets.all(1),
                                    child: Center(
                                        child: GestureDetector(
                                            onTap: () {
                                              if (quantities[index] > 1) {
                                                setState(() {
                                                  quantities[index]--;
                                                });
                                              }
                                            },
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.red,
                                              size: 30,
                                            ))),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 10,
                left: -13,
                child: AnimatedScale(
                  scale: scales[index],
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOutBack,
                  child: Image.asset(
                    item.imagePath,
                    height: 100,
                    width: 100,
                  ),
                )),
          ],
        ),
      );
    });
  }
}
