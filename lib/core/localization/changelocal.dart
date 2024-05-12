import 'dart:io';

import 'package:delivery_app/core/constant/apptheme.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = AppTheme.themeEnglish;
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? AppTheme.themeArabic : AppTheme.themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  getPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Location denied",
            "You cant access to this app without access to location");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Permission denied",
          "You can't use this app without access to location");
      myServices.sharedPreferences.setBool("location", false);
      Future.delayed(const Duration(microseconds: 500), () => {exit(0)});
    }
    if (permission == LocationPermission.always) {
      myServices.sharedPreferences.setBool("location", true);
    }
    if (permission == LocationPermission.whileInUse) {
      myServices.sharedPreferences.setBool("location", true);
    }
  }

  @override
  void onInit() {
    String? lang = myServices.sharedPreferences.getString("lang");
    getPermission();
    if (lang == "ar") {
      language = const Locale("ar");
      appTheme = AppTheme.themeArabic;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = AppTheme.themeEnglish;
    }
    super.onInit();
  }
}
