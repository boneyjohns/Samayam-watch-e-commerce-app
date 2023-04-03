import 'package:get/get.dart';

class Bottomnavcontroller extends GetxController {
  RxInt selectedindex = 0.obs;

  bottomchange(int index) {
    selectedindex.value = index;
  }
}
