import 'package:app_flutter_quiz/configs/themes/dark_theme.dart';
import 'package:app_flutter_quiz/configs/themes/light_theme.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

const Color onSurfaceTextColor = Colors.white;

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
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
