
import 'package:get/get.dart';

class ProductPageController extends GetxController{
  var sizeIndex=0.obs;
  void updateSizeIndex(int index){
    sizeIndex.value=index;
  }
}