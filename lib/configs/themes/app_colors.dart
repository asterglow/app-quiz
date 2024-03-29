import 'package:app_flutter_quiz/configs/themes/dark_theme.dart';
import 'package:app_flutter_quiz/configs/themes/light_theme.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color onSurfaceTextColor = Colors.white;

const Color correctAnsColor=Color(0xFF3ac3cb);
const Color wrongAnsColor=Color(0xFFf85187);
const Color notAnsColor=Color(0xFF2a3c65);
const Color menuIconColorDark=Color.fromARGB(255, 9, 27, 68);
const Color menuIconColorLight=Color.fromARGB(255, 189, 203, 235);

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryLightColorLight, primaryColorLight],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryDarkColorDark, primaryColorDark],
);

LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor()=> UIParameters.isDarkMode()?
Theme.of(Get.context!).cardColor.withOpacity(0.5):
Theme.of(Get.context!).primaryColor;

Color answerBorderColor()=>
UIParameters.isDarkMode()? const Color.fromARGB(255,20,46,158)
: Color.fromARGB(255, 221, 221, 221);