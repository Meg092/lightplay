import 'package:get/get.dart';

class LightSecondLogic extends GetxController {

  var title = ''.obs;

  var fontColor = 3.obs;
  var backgroundColor = 0.obs;
  var fontSizeIndex = 0.0.obs;
  var direction = 1.obs;

}

class SecondEntity {
  String title;
  int fontColor;
  int backgroundColor;
  double fontSize;
  int direction;

  SecondEntity(this.title, this.fontColor, this.backgroundColor, this.fontSize,
      this.direction);
}
