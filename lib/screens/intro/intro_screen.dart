import 'package:app_flutter_quiz/configs/themes/app_colors.dart';
import 'package:app_flutter_quiz/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
                // color: Colors.amber,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "ଏଈ କୁଈଜ ଆପ୍  Choose from subjects and no of questions",
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ).copyWith(fontFamily: 'Kalinga'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              AppCircleButton(
                onTap: () {
                  Get.offAndToNamed("/home");
                },
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                  // color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
