
import 'package:get/get.dart';

class MainPageController extends GetxController{
var selectIndex = 0.obs;
var activeIndex = 0.obs;

void updateIndex(int index){
  selectIndex.value=index;
}

void updateActiveIndex(int index){
  activeIndex.value=index;
}
}