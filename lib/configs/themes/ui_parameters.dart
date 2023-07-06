import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _screenPadding = 15.0;
const double _cardBorderRadius = 10.0;
double get screenPadding => _screenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get screenPadding => const EdgeInsets.all(_screenPadding);
  static bool isDarkMode() {
    // return Theme.of(context).brightness == Brightness.dark;
    return Get.isDarkMode
        ? true
        : false; //getX feature, detects mode, keeps track of context everywhere
  }
}
