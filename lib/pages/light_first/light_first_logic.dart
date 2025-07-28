import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:torch_controller/torch_controller.dart';

class LightFirstLogic extends GetxController {
  final torchController = TorchController();

  var isTorchOn = false.obs;

  var touchIndex = 0.obs;

  Timer? flashTimer;

  Timer? sosTimer;

  final List<Map<String, dynamic>> _longShortLongPattern = [
    {'state': true, 'duration': 800},
    {'state': false, 'duration': 300},
    {'state': true, 'duration': 300},
    {'state': false, 'duration': 300},
    {'state': true, 'duration': 800},
    {'state': false, 'duration': 1500}
  ];

  int _currentStep = 0;

  Future<void> toggleTorch() async {
    if (await Permission.camera.request().isGranted) {
      final active = await torchController.toggle() ?? false;
      isTorchOn.value = active;
    } else {
      Fluttertoast.showToast(msg: 'Camera permission has not been obtained');
    }
  }

  Future<void> closeTorch(int index) async {
    if (await Permission.camera.request().isGranted) {
      if (isTorchOn.value && index != touchIndex.value) {
        flashStopTimer();
        sosStopTimer();
        final active = await torchController.toggle() ?? false;
        isTorchOn.value = active;
      }
    } else {
      Fluttertoast.showToast(msg: 'Camera permission has not been obtained');
    }
  }

  void flashStartTimer() async {
    if (await Permission.camera.request().isGranted) {
      isTorchOn.value = true;
      flashTimer =
          Timer.periodic(const Duration(milliseconds: 200), (timer) async {
            await torchController.toggle();
          });
    } else {
      Fluttertoast.showToast(msg: 'Camera permission has not been obtained');
    }

  }

  void flashStopTimer() async {
    flashTimer?.cancel();
    flashTimer = null;
    if (await Permission.camera.request().isGranted) {
      if (isTorchOn.value) {
        final active = await torchController.toggle() ?? false;
        isTorchOn.value = active;
      }
    }
    isTorchOn.value = false;
  }

  void sosCTimer() async {
    final step = _longShortLongPattern[_currentStep];
    final bool state = step['state'] as bool;
    final int duration = step['duration'] as int;

    await torchController.toggle();

    sosTimer = Timer(Duration(milliseconds: duration), () {
      _currentStep = (_currentStep + 1) % _longShortLongPattern.length;
      sosCTimer();
    });
  }

  void sosStartTimer() async {
    if (await Permission.camera.request().isGranted) {
      isTorchOn.value = true;
      sosCTimer();
    } else {
      Fluttertoast.showToast(msg: 'Camera permission has not been obtained');
    }

  }

  void sosStopTimer() async {
    sosTimer?.cancel();
    sosTimer = null;
    if (await Permission.camera.request().isGranted) {
      if (isTorchOn.value) {
        final active = await torchController.toggle() ?? false;
        isTorchOn.value = active;
      }
    }
    isTorchOn.value = false;
  }
}
