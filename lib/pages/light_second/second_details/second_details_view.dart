import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_play/main.dart';
import 'package:marquee/marquee.dart';
import 'package:styled_widget/styled_widget.dart';

import 'second_details_logic.dart';

class SecondDetailsPage extends GetView<SecondDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: null,
          foregroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Marquee(
              text: controller.entity.title,
              textDirection: controller.entity.direction == 1 ? TextDirection.ltr : TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorList[controller.entity.fontColor],
                  fontSize: 20 + controller.entity.fontSize),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: Get.width*1.3,
              velocity: 100.0,
              pauseAfterRound: const Duration(seconds: 2),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 2),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
        ).decorated(color: colorList[controller.entity.backgroundColor]));
  }
}
