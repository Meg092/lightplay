import 'package:get/get.dart';

import 'light_second_logic.dart';

class LightSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightSecondLogic());
  }
}
