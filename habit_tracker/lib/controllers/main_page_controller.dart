
import 'package:get/get.dart';

class MainPageController extends GetxController{

  var selectIndex=(-1).obs;
  var navselect=0.obs;

  void selectDate(int index){
    selectIndex.value=index;

  }
  void selectNav(int index){
    navselect.value=index;
  }
}