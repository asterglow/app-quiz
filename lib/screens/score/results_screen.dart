import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/extension_quiz_controller.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';
import 'package:app_flutter_quiz/widgets/common/app_appbar.dart';
import 'package:app_flutter_quiz/widgets/common/background_decoration.dart';
import 'package:app_flutter_quiz/widgets/content_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResultsScreen extends GetView<QuizController> {
  const ResultsScreen({super.key});
  static const String routeName = "/results";

  @override
  Widget build(BuildContext context) {
    Color _textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      body: BackgroundDecoration(
        child: Column(
          children: [
            AppAppBar(
              leading: const SizedBox(
                height: 80,
              ),
              title: controller.correctQuestions,
            ),
            Expanded(
              child: ContentArea(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/images/bulb.svg"),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        "Congratulations",
                        style: headerTextStyle.copyWith(
                          color: _textColor,
                        ),
                      ),
                    ),
                    Text(
                      "You scored 10 Points",
                      style: TextStyle(color: _textColor),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Tap below the Question number to view Correct answers",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
