import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  final RxInt currentStatusIndex = 0.obs;

  void changeStatusIndex(int index) {
    currentStatusIndex.value = index;
    update(["statusIndex"]);
  }
}
