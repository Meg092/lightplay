import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LightTabLogic extends GetxController {

  PageController pageController = PageController();
  var currentIndex = 0.obs;

  void cuiyiqqwe() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Get.toNamed('/RefreshPage');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cuiyiqqwe();
    super.onInit();
  }

}
