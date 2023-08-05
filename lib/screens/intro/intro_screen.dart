import 'package:app_flutter_quiz/configs/themes/app_colors.dart';
import 'package:app_flutter_quiz/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
                // color: Colors.amber,
              ).animate().fadeIn(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(milliseconds: 1000)),
              const SizedBox(
                height: 40,
              ),
              Text(
                "QuizShala is made for practicing Adarsh Vidyalaya Entrance Tests.\nChoose a quiz subject and view the underlying concepts for each question after the test.",
                style: const TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ).copyWith(fontFamily: 'Kalinga'),
                textAlign: TextAlign.center,
              ).animate().fadeIn(
                  delay: const Duration(milliseconds: 1000),
                  duration: const Duration(milliseconds: 1000)),
              const SizedBox(
                height: 40,
              ),
              Text(
                "କୁଈଜଶାଳା ଆପ୍ ରେ OAVS Entrance Test ର ପ୍ରତି ବିଷୟ ପାଇଁ ଅଲଗା MCQ ପରୀକ୍ଷା ଅଛି|\nବିଷୟ ବାଛି କି ପରୀକ୍ଷା ଦିଅନ୍ତୁ ଏବଂ ପରୀକ୍ଷା ଫଳ ରେ ପ୍ରତି ପ୍ରଶ୍ନ ର ମୂଳ ତଥ୍ୟ ତା ପଢି ପାରିବେ",
                style: const TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ).copyWith(fontFamily: 'Kalinga'),
                textAlign: TextAlign.center,
              ).animate().fadeIn(
                  delay: const Duration(milliseconds: 1500),
                  duration: const Duration(milliseconds: 1000)),
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
