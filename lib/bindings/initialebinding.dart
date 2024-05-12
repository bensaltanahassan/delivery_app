import 'package:delivery_app/core/class/crud.dart';
import 'package:get/get.dart';

class InitialeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
