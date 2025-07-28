import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_play/pages/light_first/custom_light.dart';
import 'package:styled_widget/styled_widget.dart';

import 'alarm_details_logic.dart';

class AlarmDetailsPage extends GetView<AlarmDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Alarm',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: <Widget>[
        Expanded(
            child: CustomLight(
                duration: 300,
                color: const Color(0xffff0000),
                delay: 150,
                child: const SizedBox(
                  width: double.infinity,
                ))),
        Expanded(
            child: CustomLight(
                duration: 300,
                color: const Color(0xff004eff),
                delay: 125,
                child: const SizedBox(
                  width: double.infinity,
                )))
      ].toColumn(),
    );
  }
}
