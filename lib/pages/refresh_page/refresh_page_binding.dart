import 'package:get/get.dart';

import 'refresh_page_logic.dart';

class RefreshPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RefreshPageLogic());
  }
}
