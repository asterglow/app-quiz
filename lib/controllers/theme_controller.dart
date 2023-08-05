import 'package:app_flutter_quiz/configs/themes/dark_theme.dart';
import 'package:app_flutter_quiz/configs/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController{
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  final _getStorage = GetStorage();
  final storageKey = "isDarkMode";

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

  ThemeMode getTheme(){
    // print(isSavedDarkTheme());
    return isSavedDarkTheme() ? ThemeMode.dark :ThemeMode.light;
  }

  bool isSavedDarkTheme(){
    // print('${_getStorage.read(storageKey)}, isSavedDarkTheme');
    return _getStorage.read(storageKey)?? true;
  }

  void saveTheme(bool isDarkMode){
    _getStorage.write(storageKey, isDarkMode);
    // print("savedtheme, ${isSavedDarkTheme()}");
  }

  void toggleTheme(){
    Get.changeThemeMode(isSavedDarkTheme()? ThemeMode.light:ThemeMode.dark) ;
    saveTheme(!isSavedDarkTheme());
    // print('toggled theme, ${isSavedDarkTheme()}');
  }
}