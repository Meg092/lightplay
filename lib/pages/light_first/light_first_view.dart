import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'light_first_logic.dart';

class LightFirstPage extends GetView<LightFirstLogic> {
  Widget _bottomItem(int index) {
    final titles = ['Alarm', 'Traffic lights', 'More lights'];
    return Expanded(
        child: Container(
      height: 132,
      child: <Widget>[
        Image.asset(
          'assets/icon${4 + index}.webp',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          titles[index],
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
    )
            .decorated(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: const Color(0xff3b3b3b)),
                color: const Color(0xff272727))
            .gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed('/AlarmDetails');
          break;
        case 1:
          Get.toNamed('/RedGreenLight');
          break;
        case 2:
          Get.toNamed('/MulticoloredLights');
          break;
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Obx(() {
            return Image.asset(
              'assets/icon${controller.isTorchOn.value ? 1 : 0}.webp',
              fit: BoxFit.cover,
            );
          }),
          Obx(() {
            return Image.asset(
              'assets/icon${controller.isTorchOn.value ? 3 : 2}.webp',
              fit: BoxFit.cover,
            ).gestures(onTap: () {
              if (controller.touchIndex.value == 0) {
                controller.toggleTorch();
              } else if (controller.touchIndex.value == 1) {
                if (controller.isTorchOn.value) {
                  controller.flashStopTimer();
                } else {
                  controller.flashStartTimer();
                }
              } else {
                if (controller.isTorchOn.value) {
                  controller.sosStopTimer();
                } else {
                  controller.sosStartTimer();
                }
              }
            });
          }).marginOnly(top: 256),
          SafeArea(
              child: SizedBox(
            width: double.infinity,
            height: 440,
            child: <Widget>[
              Container(
                width: double.infinity,
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: <Widget>[
                  Obx(() {
                    return Text(
                      'Flashlight',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: controller.touchIndex.value == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: controller.touchIndex.value == 0
                              ? Colors.white
                              : const Color(0xff585858)),
                    ).gestures(onTap: () {
                      controller.closeTorch(0);
                      controller.touchIndex.value = 0;
                    });
                  }),
                  Obx(() {
                    return Text(
                      'Flash lamp',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: controller.touchIndex.value == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: controller.touchIndex.value == 1
                              ? Colors.white
                              : const Color(0xff585858)),
                    ).gestures(onTap: () {
                      controller.closeTorch(1);
                      controller.touchIndex.value = 1;
                    });
                  }),
                  Obx(() {
                    return Text(
                      'SOS',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: controller.touchIndex.value == 2
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: controller.touchIndex.value == 2
                              ? Colors.white
                              : const Color(0xff585858)),
                    ).gestures(onTap: () {
                      controller.closeTorch(2);
                      controller.touchIndex.value = 2;
                    });
                  }),
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              ).decorated(
                  borderRadius: BorderRadius.circular(27),
                  border: Border.all(color: const Color(0xff3b3b3b)),
                  color: const Color(0xff272727)),
              <Widget>[
                _bottomItem(0),
                const SizedBox(
                  width: 10,
                ),
                _bottomItem(1),
                const SizedBox(
                  width: 10,
                ),
                _bottomItem(2)
              ].toRow()
            ].toColumn(mainAxisAlignment: MainAxisAlignment.spaceBetween),
          ).marginAll(15))
        ].toStack(alignment: Alignment.topCenter),
      ),
    );
  }
}
