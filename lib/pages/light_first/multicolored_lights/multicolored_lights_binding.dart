import 'package:get/get.dart';

import 'multicolored_lights_logic.dart';

class MulticoloredLightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MulticoloredLightsLogic());
  }
}
