
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class RefreshPageLogic extends GetxController {

  void qancjbgncsd() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Fluttertoast.showToast(msg: 'Please check the network and refreshn');
    } else {
      Fluttertoast.showToast(msg: 'Your network connection has been restored');
      Get.back();
    }
  }

}
