import 'package:get/get.dart';

import 'flash_light_logic.dart';

class FlashLightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlashLightLogic());
  }
}
