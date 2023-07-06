import 'package:app_flutter_quiz/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Image.asset(
          "assets/images/app_splash_logo.png",
          // scale: 0.4,
          // width: 40,
          // height: 40,
        ),
      ),
    );
  }
}
