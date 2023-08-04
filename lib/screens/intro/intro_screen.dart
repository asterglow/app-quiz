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
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
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
                "QuizShala to prepare for Adarsh Vidyalaya Entrance Tests. Choose a quiz subject and check the concepts for each question after submitting the answers.\n\nକୁଈଜଶାଳା ଆପ୍ ରେ OAVS Entrance Test ର ପ୍ରତି ବିଷୟ ପାଇଁ ଅଲଗା MCQ ପରୀକ୍ଷା ଅଛି| ବିଷୟ ବାଛି କି ପରୀକ୍ଷା ଦିଅନ୍ତୁ ଏବଂ ପରୀକ୍ଷା ଫଳ ରେ ପ୍ରତି ପ୍ରଶ୍ନ ର ମୂଳ ତଥ୍ୟ ତା ପଢି ପାରିବେ",
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
