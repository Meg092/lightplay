import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_play/pages/light_first/light_first_view.dart';
import 'package:light_play/pages/light_second/light_second_view.dart';
import 'package:light_play/pages/light_third/light_third_view.dart';

import 'light_tab_logic.dart';

class LightTabPage extends GetView<LightTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [LightFirstPage(),LightSecondPage(),LightThirdPage()],
      ),
      bottomNavigationBar: Obx(() => _navLightBars()),
    );
  }

  Widget _navLightBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item0Grey.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item0Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item1Grey.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item1Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'Bullet comments',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item2Grey.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item2Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) async {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
