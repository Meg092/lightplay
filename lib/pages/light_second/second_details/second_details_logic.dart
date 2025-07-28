import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:light_play/pages/light_second/light_second_logic.dart';

class SecondDetailsLogic extends GetxController {

  SecondEntity entity = Get.arguments;

  @override
  void onInit() async {
    // TODO: implement onInit
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    super.onInit();
  }

}
