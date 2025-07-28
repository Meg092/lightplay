import 'package:get/get.dart';

import 'red_green_light_logic.dart';

class RedGreenLightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RedGreenLightLogic());
  }
}
