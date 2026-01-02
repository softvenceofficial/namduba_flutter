import 'package:get/get.dart';

class OrderDetailController extends GetxController{
  RxBool popUp = false.obs;

  void showPopUp() {
    popUp.value = !popUp.value;
    update();
  }


}