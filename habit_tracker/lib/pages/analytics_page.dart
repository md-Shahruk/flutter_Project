import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/models/forLandingPage.dart';
import 'package:habit_tracker/widgets/callorie_burn_box.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> tasks = [
      {"task": "Workout on Gym", "status": "Completed!"},
      {"task": "Eat Food ", "status": "Not yet!"},
      {"task": "Guitar Practice", "status": "Completed!"},
      {"task": "Yoga Session", "status": "Completed!"},
      {"task": "Go to Bangladesh", "status": "Not yet!"},
      {"task": "Reading Book", "status": "Completed!"},
      {"task": "Play PUBG", "status": "Not Started!"},
      {"task": "Swimming in the sea", "status": "Completed!"},
      {"task": "Bicycling ", "status": "Not Started!"},
      {"task": "Play Cricket ", "status": "Not Started!"},
    ];

    Color getStatusColor(String status) {
      switch (status) {
        case "Completed!":
          return const Color(0xFF9DDEB8);
        case "Not yet!":
          return const Color(0xFFFFC107);
        default:
          return const Color(0xFFEE8B8B);
      }
    }

    // final height = MediaQuery.sizeOf(context).height * 1;
    // final width = MediaQuery.sizeOf(context).width * 1;
    final screenSize = MediaQuery.sizeOf(context);
    final height = screenSize.height*1;
    final width = screenSize.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.058, right: width * 0.05, left: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadContainerIcon(
                      height,
                      width,
                      Icons.menu,
                    ),
                    Text(
                      "Calorie stats",
                      style: TextStyle(
                          fontSize: width * 0.054,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    HeadContainerIcon(
                      height,
                      width,
                      Icons.calendar_month_outlined,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                BarChartProperties(height, width),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "Challenge",
                      style: GoogleFonts.poppins(
                          fontSize: width * 0.06,
                          color: const Color(0xFF343434),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See all",
                      style: GoogleFonts.poppins(
                          fontSize: width * 0.04,
                          color: const Color(0xFF343434).withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: ListView.builder(
                      itemCount: Habit.habits.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final habit = Habit.habits[index];
                        final task = tasks[index];
                        return Container(
                          // margin: EdgeInsets.all(height*0.02),
                          height: 90,
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 67,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Center(
                                  child: Image.asset(habit.imagePath),
                                ),
                              ),
                               SizedBox(width: width*0.04,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text(
                                      task["task"]!,
                                      style: GoogleFonts.lato(
                                          fontSize: width * 0.045,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF343434)),
                                    ),
                                    Text(
                                      task["status"]!,
                                      style: GoogleFonts.lato(
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.bold,
                                        color: getStatusColor(task["status"]!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '🔥',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.red),
                                  ),
                                  Text(
                                    '322 Calls',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: height * 0.08,
                )
              ],
            )),
      ),
    );
  }

  Widget HeadContainerIcon(double height, double width, IconData icon) {
    return Container(
      height: 50, width: 50,
      // height: height * 0.065, width: width * 0.13,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 2,
          )),
      child: Center(
        child: Icon(
          icon,
          color: Colors.black,
          size: width * 0.07,
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    List<double> barHeight = [1, 2, 3, 4, 3, 4, 1];
    return List.generate(barHeight.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: barHeight[index], // Bar size
            width: 22,
            color: index == 3
                ? const Color(0xFFFD5B32)
                : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          )
        ],
      );
    });
  }

  Widget BarChartProperties(double height, double width) {
    return Container(
      height: height * 0.39,
      width: width * 0.9,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.09),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.grey,
          )),
      padding: const EdgeInsets.all(10),
      child: Column(
        //
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Analytics",
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "7,830 Calls",
            style: GoogleFonts.lato(
                color: Colors.redAccent,
                fontSize: width * 0.04,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 75,
            child: Burn(),
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups: _getBarGroups(),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
