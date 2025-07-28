import 'package:get/get.dart';

import 'second_details_logic.dart';

class SecondDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecondDetailsLogic());
  }
}
