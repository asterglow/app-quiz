import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

TextStyle quizTitleTextStyle(context) => TextStyle(
      color: UIParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyLarge!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailTextStyle = TextStyle(fontSize: 12);