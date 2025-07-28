import 'package:get/get.dart';

import 'play_start_logic.dart';

class PlayStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PlayStartLogic(),
      permanent: true,
    );
  }
}
