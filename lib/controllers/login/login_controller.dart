import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final MyServices services = Get.find<MyServices>();

  final RxBool showPassword = RxBool(false);
  final RxBool isLoading = RxBool(false);

  void handlePassword() {
    showPassword.value = !showPassword.value;
    update(["password"]);
  }

  void login() async {
    isLoading.value = true;
    update(['loading']);
    await Future.delayed(const Duration(seconds: 2));
    await services.sharedPreferences.setBool("login", true);
    isLoading.value = false;
    update(['loading']);
    Get.offAllNamed(AppRoutes.orders);
  }

  @override
  void onClose() {
    // ignore: invalid_use_of_protected_member
    formState.currentState?.dispose();
    showPassword.close();
    isLoading.close();
    super.onClose();
  }
}
