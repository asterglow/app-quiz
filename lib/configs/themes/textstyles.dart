import 'package:app_flutter_quiz/configs/themes/app_colors.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle quizTitleTextStyle(context) => TextStyle(
      color: UIParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyLarge!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailTextStyle = TextStyle(fontSize: 14);
const headerTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor,
);
const quizTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w800,
);

const appBarTS = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: onSurfaceTextColor
);

TextStyle timerTS()=>
TextStyle(
  letterSpacing: 2,
  color: UIParameters.isDarkMode()? 
  Theme.of(Get.context!).textTheme.bodyLarge!.color
  : Theme.of(Get.context!).primaryColor,
  fontWeight: FontWeight.w600,
);