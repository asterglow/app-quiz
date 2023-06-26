import 'package:app_flutter_quiz/configs/themes/dark_theme.dart';
import 'package:app_flutter_quiz/configs/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit(){
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData(){
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}