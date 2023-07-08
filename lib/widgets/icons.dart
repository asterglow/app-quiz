import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._(); //singleton class with pvt constructor, instance called once and no instance outside, singletons keep code simple but too many makes unit tests diffcult
  static const fontfam = 'AppIcons';
  static const IconData trophy = IconData(0xe808, fontFamily: fontfam);
}
