import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:light_play/main.dart';
import 'package:light_play/pages/light_second/light_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'light_second_logic.dart';

class LightSecondPage extends GetView<LightSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Bullet comments',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Obx(() {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: colorList[controller.backgroundColor.value],
                    borderRadius: BorderRadius.circular(27)),
                constraints: const BoxConstraints(minHeight: 127),
                width: double.infinity,
                child: Obx(() {
                  return Text(
                    controller.title.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorList[controller.fontColor.value],
                        fontSize: 20.0 + controller.fontSizeIndex.value,
                        fontWeight: FontWeight.bold),
                  );
                }),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 58,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: <Widget>[
                Expanded(
                    child: LightTextField(
                        value: controller.title.value,
                        maxLength: 50,
                        textStyle: const TextStyle(color: Colors.white),
                        hintText: 'Enter the bullet comments',
                        onChange: (v) {
                          controller.title.value = v;
                        })),
                Container(
                  width: 95,
                  height: 42,
                  alignment: Alignment.center,
                  child: const Text(
                    'Create',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
                    .decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(21))
                    .gestures(onTap: () {
                  if (controller.title.value.isEmpty) {
                    Fluttertoast.showToast(msg: 'Please enter a title');
                    return;
                  }
                  print(controller.direction.value);
                  Get.toNamed('/SecondDetails',
                          arguments: SecondEntity(
                              controller.title.value,
                              controller.fontColor.value,
                              controller.backgroundColor.value,
                              controller.fontSizeIndex.value,
                              controller.direction.value))
                      ?.then((_) async {
                    await SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
                  });
                })
              ].toRow(),
            ).decorated(
                color: const Color(0xff404040),
                borderRadius: BorderRadius.circular(29)),
            const SizedBox(
              height: 15,
            ),
            <Widget>[
              const Text(
                'Font color',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 26,
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisSpacing: 7),
                    itemCount: colorList.length,
                    itemBuilder: (_, index) {
                      return Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                              border: controller.fontColor.value == index
                                  ? Border.all(color: Colors.white)
                                  : Border.all(
                                      color: Colors.white.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(13)),
                          alignment: Alignment.center,
                          child: Text(
                            'A',
                            style: TextStyle(
                                color: colorList[index],
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ).gestures(onTap: () {
                          controller.fontColor.value = index;
                        });
                      });
                    }),
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            Divider(
              height: 25,
              color: Colors.white.withOpacity(0.08),
            ),
            <Widget>[
              const Text(
                'Background color',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: 26,
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, mainAxisSpacing: 7),
                      itemCount: colorList.length,
                      itemBuilder: (_, index) {
                        return Obx(() {
                          return Container(
                            decoration: BoxDecoration(
                                border:
                                    controller.backgroundColor.value == index
                                        ? Border.all(color: Colors.white)
                                        : null,
                                color: colorList[index],
                                borderRadius: BorderRadius.circular(13)),
                          ).gestures(onTap: () {
                            controller.backgroundColor.value = index;
                          });
                        });
                      }),
                ),
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            Divider(
              height: 25,
              color: Colors.white.withOpacity(0.08),
            ),
            <Widget>[
              const Text(
                'Font size',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 26,
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisSpacing: 7),
                    itemCount: colorList.length,
                    itemBuilder: (_, index) {
                      return Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                              border: controller.fontSizeIndex.value == index
                                  ? Border.all(color: Colors.white)
                                  : Border.all(
                                      color: Colors.white.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(13)),
                          alignment: Alignment.center,
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: controller.fontSizeIndex.value == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.4),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ).gestures(onTap: () {
                          controller.fontSizeIndex.value = index.toDouble();
                        });
                      });
                    }),
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            Divider(
              height: 25,
              color: Colors.white.withOpacity(0.08),
            ),
            <Widget>[
              const Text(
                'Direction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              <Widget>[
                Obx(() {
                  return Container(
                    width: 120,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                            color: controller.direction.value == 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.4))),
                    child: Obx(() {
                      return Text(
                        'Left to Right',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: controller.direction.value == 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.4)),
                      );
                    }),
                  );
                }).gestures(onTap: () {
                  controller.direction.value = 0;
                }),
                const SizedBox(
                  width: 10,
                ),
                Obx(() {
                  return Container(
                    width: 120,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                            color: controller.direction.value == 1
                                ? Colors.white
                                : Colors.white.withOpacity(0.4))),
                    child: Obx(() {
                      return Text(
                        'Right to left',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: controller.direction.value == 1
                                ? Colors.white
                                : Colors.white.withOpacity(0.4)),
                      );
                    }),
                  );
                }).gestures(onTap: () {
                  controller.direction.value = 1;
                })
              ].toRow(mainAxisAlignment: MainAxisAlignment.end)
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
