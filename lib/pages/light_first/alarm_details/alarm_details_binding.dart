import 'package:get/get.dart';

import 'alarm_details_logic.dart';

class AlarmDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlarmDetailsLogic());
  }
}
