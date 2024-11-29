

import 'package:get/get.dart';

class Landingpagecontroller extends GetxController{
  var selectIndicis=<int>{}.obs;

  void toggleSelection(int index){
    if(selectIndicis.contains(index)){
      selectIndicis.remove(index);
    }else{
      selectIndicis.add(index);
    }
  }
}