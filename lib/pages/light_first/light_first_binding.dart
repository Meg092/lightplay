import 'package:get/get.dart';

import 'light_first_logic.dart';

class LightFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightFirstLogic());
  }
}
