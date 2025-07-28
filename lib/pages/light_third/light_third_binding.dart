import 'package:get/get.dart';

import 'light_third_logic.dart';

class LightThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightThirdLogic());
  }
}
