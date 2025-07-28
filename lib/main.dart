import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:light_play/pages/light_first/alarm_details/alarm_details_binding.dart';
import 'package:light_play/pages/light_first/alarm_details/alarm_details_view.dart';
import 'package:light_play/pages/light_first/flash_light/flash_light_binding.dart';
import 'package:light_play/pages/light_first/flash_light/flash_light_view.dart';
import 'package:light_play/pages/light_first/light_first_binding.dart';
import 'package:light_play/pages/light_first/light_first_view.dart';
import 'package:light_play/pages/light_first/multicolored_lights/multicolored_lights_binding.dart';
import 'package:light_play/pages/light_first/multicolored_lights/multicolored_lights_view.dart';
import 'package:light_play/pages/light_first/play_start/play_start_binding.dart';
import 'package:light_play/pages/light_first/play_start/play_start_view.dart';
import 'package:light_play/pages/light_first/red_green_light/red_green_light_binding.dart';
import 'package:light_play/pages/light_first/red_green_light/red_green_light_view.dart';
import 'package:light_play/pages/light_first/sos_light/change_light.dart';
import 'package:light_play/pages/light_first/sos_light/sos_light_binding.dart';
import 'package:light_play/pages/light_first/sos_light/sos_light_view.dart';
import 'package:light_play/pages/light_second/light_second_binding.dart';
import 'package:light_play/pages/light_second/light_second_view.dart';
import 'package:light_play/pages/light_second/second_details/second_details_binding.dart';
import 'package:light_play/pages/light_second/second_details/second_details_view.dart';
import 'package:light_play/pages/light_tab/light_tab_binding.dart';
import 'package:light_play/pages/light_tab/light_tab_view.dart';
import 'package:light_play/pages/light_third/light_third_binding.dart';
import 'package:light_play/pages/light_third/light_third_view.dart';
import 'package:light_play/pages/refresh_page/refresh_page_binding.dart';
import 'package:light_play/pages/refresh_page/refresh_page_view.dart';
import 'package:torch_controller/torch_controller.dart';

Color primaryColor = const Color(0xff1d1d1d);
Color bgColor = const Color(0xff1d1d1d);

List<Color> colorList = const [
  Color(0xffff0000),
  Color(0xffff7600),
  Color(0xffffeb00),
  Color(0xff00ff1d),
  Color(0xff00ebff),
  Color(0xff0a00ff),
  Color(0xfff500ff),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Years,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          selectedItemColor: Colors.white,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          elevation: 0,
          backgroundColor: Color(0xff292929),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Years = [
  GetPage(name: '/', page: () => PlayStartView(), binding: PlayStartBinding()),
  GetPage(name: '/LightTab', page: () => LightTabPage(), binding: LightTabBinding()),
  GetPage(name: '/LightFirst', page: () => LightFirstPage(), binding: LightFirstBinding()),
  GetPage(name: '/LightSecond', page: () => LightSecondPage(), binding: LightSecondBinding()),
  GetPage(name: '/LightThird', page: () => LightThirdPage(), binding: LightThirdBinding()),
  GetPage(name: '/ChangeLight', page: () => ChangeLight()),
  GetPage(name: '/AlarmDetails', page: () => AlarmDetailsPage(), binding: AlarmDetailsBinding()),
  GetPage(name: '/RedGreenLight', page: () => RedGreenLightPage(), binding: RedGreenLightBinding()),
  GetPage(name: '/FlashLight', page: () => FlashLightPage(), binding: FlashLightBinding()),
  GetPage(name: '/MulticoloredLights', page: () => MulticoloredLightsPage(), binding: MulticoloredLightsBinding()),
  GetPage(name: '/SOSLight', page: () => SosLightPage(), binding: SosLightBinding()),
  GetPage(name: '/SecondDetails', page: () => SecondDetailsPage(), binding: SecondDetailsBinding()),
  GetPage(name: '/RefreshPage', page: () => RefreshPageView(), binding: RefreshPageBinding()),
];