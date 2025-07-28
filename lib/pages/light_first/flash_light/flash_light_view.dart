import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_light.dart';
import 'flash_light_logic.dart';

class FlashLightPage extends GetView<FlashLightLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Flash lamp',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: CustomLight(
          duration: 100,
          color: Colors.white,
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
          )),
    );
  }
}
