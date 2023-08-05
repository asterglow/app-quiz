import 'package:app_flutter_quiz/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        // decoration: BoxDecoration(gradient: mainGradient()),
        child: Image.asset(
          "assets/images/logo.png",
          // scale: 0.4,
          // width: 40,
          // height: 40,
        )
            .animate()
            .fadeIn(duration: const Duration(milliseconds: 1500))
            .scaleXY(
                begin: 0.4, end: 0.8, duration: const Duration(milliseconds: 2000))
            .shimmer(
                delay: const Duration(milliseconds: 1500),
                duration: const Duration(milliseconds: 3000))
                .then(duration: const Duration(milliseconds: 2500)),
      ),
    );
  }
}
