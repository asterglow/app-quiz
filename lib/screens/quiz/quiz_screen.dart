import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';
import 'package:app_flutter_quiz/firebase_ref/loading_status.dart';
import 'package:app_flutter_quiz/widgets/common/background_decoration.dart';
import 'package:app_flutter_quiz/widgets/common/quiz_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({super.key});

  static const String routeName = "/quiz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Obx(() => Column(
              children: [
                // if (controller.loadingStatus.value == LoadingStatus.loading)
                  const Expanded(
                    child: QuizPlaceholder(),
                  ),
                // if (controller.loadingStatus.value == LoadingStatus.completed)
                  // Expanded(
                  //   child: SingleChildScrollView(
                  //     child: Column(
                  //       children: [
                  //         Text(
                  //           controller.currentQuestion.value!.question,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
              ],
            )),
      ),
    );
  }
}
