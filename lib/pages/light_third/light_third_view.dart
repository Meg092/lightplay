import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'light_third_logic.dart';

class LightThirdPage extends GetView<LightThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['App version'];
    return Container(
      height: 30,
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(color: Colors.white),
        ),
        Obx(() {
          return Text(
            controller.appVersion.value,
            style: const TextStyle(color: Colors.white),
          );
        }),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            title: const Text(
              'Setting',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                padding: const EdgeInsets.all(12),
                child: <Widget>[_item(0, context)].toColumn(
                    separator: Divider(
                  height: 15,
                  color: Colors.grey.withOpacity(0.3),
                )),
              ).decorated(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: const Color(0xff3b3b3b)),
                  color: const Color(0xff272727))
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          ).marginAll(15)),
        ));
  }
}
