import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeListPage extends StatefulWidget {
  @override
  _CoffeeListPageState createState() => _CoffeeListPageState();
}

class _CoffeeListPageState extends State<CoffeeListPage> {
  final List<String> coffeeNames = ["Espresso", "Latte", "Cappuccino", "Mocha", "Americano"];
  int selectedIndex = 0; // Track the selected coffee index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Column(
        children: [
          SizedBox(height: 50), // Add spacing for the status bar if needed
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 10),
            //color: Colors.brown[900],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeNames.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Update selected coffee index
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        coffeeNames[index],
                        style: GoogleFonts.sora(
                          fontSize: 18,
                          color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
