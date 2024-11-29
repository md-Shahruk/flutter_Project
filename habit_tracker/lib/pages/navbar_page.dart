import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controllers/main_page_controller.dart';
import 'package:habit_tracker/pages/analytics_page.dart';
import 'package:habit_tracker/pages/main_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainPageController mainPageController = Get.put(MainPageController());

    final List<Widget> _pages = [
      const MainPage(),
      const AnalyticsPage(),
    ];

    final List<IconData> _icons = [
      Icons.home,
      Icons.analytics,
      Icons.show_chart,
      Icons.person,
    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Obx(
            () => IndexedStack(
              index: mainPageController.navselect.value,
              children: _pages, // Pages list
            ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _icons.length,
                (index) {
              return Obx(
                    () => GestureDetector(
                  onTap: () {
                    mainPageController.selectNav(index);
                  },
                  child: Icon(
                    _icons[index],
                    size: 35,
                    color: mainPageController.navselect.value == index
                        ? Colors.black
                        : Colors.grey.shade400,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
