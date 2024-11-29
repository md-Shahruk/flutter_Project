
import 'package:get/get.dart';
import 'package:habit_tracker/controllers/landingPageController.dart';
import 'package:habit_tracker/controllers/main_Page_animationController.dart';
import 'package:habit_tracker/controllers/main_page_controller.dart';

class FirstBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Landingpagecontroller>(()=> Landingpagecontroller());
    Get.lazyPut<MainPageController>(()=> MainPageController());
    Get.lazyPut<MainPageAnimationcontroller>(()=> MainPageAnimationcontroller());
  }
}