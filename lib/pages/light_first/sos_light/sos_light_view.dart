import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_play/pages/light_first/custom_light.dart';

import 'sos_light_logic.dart';

class SosLightPage extends GetView<SosLightLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'SOS',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: CustomLight(
          duration: 500,
          delay: 200,
          color: Colors.white,
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
          )),
    );
  }
}
