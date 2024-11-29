import 'package:get/get.dart';
import 'package:habit_tracker/bindings/first_bindings.dart';
import 'package:habit_tracker/pages/landing_page.dart';
import 'package:habit_tracker/pages/main_page.dart';
import 'package:habit_tracker/pages/navbar_page.dart';

class AppRoutes {
  static final initialRoutes = '/landing';
  static final routes = [
    GetPage(name: '/landing', page: () => LandingPage(), binding: FirstBindings()),
    GetPage(name: '/customnavbar', page: () => CustomBottomNavBar(), binding: FirstBindings()),
    GetPage(name: '/mainPage', page: () => const MainPage(), binding: FirstBindings()),


  ];
}