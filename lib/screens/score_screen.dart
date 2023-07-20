import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';
import 'package:app_flutter_quiz/screens/home/question_card.dart';
import 'package:app_flutter_quiz/widgets/common/app_appbar.dart';
import 'package:app_flutter_quiz/widgets/common/background_decoration.dart';
import 'package:app_flutter_quiz/widgets/content_area.dart';
import 'package:app_flutter_quiz/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreScreen extends GetView<QuizController> {
  const ScoreScreen({super.key});
  static const String routeName = "/scorescreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppAppBar(
        title: controller.completedQuiz,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                  child: Column(
                children: [
                  Row(
                    children: [
                      AppTimer(
                        color: UIParameters.isDarkMode()
                            ? Theme.of(context).textTheme.bodyLarge!.color
                            : Theme.of(context).primaryColor,
                        time: '',
                      ),
                      Obx(
                        () => Text(
                          "${controller.time.value} Remaining",
                          style: timerTS(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: GridView.builder(
                      itemCount: controller.allQuestions.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (Get.width / 75).floor(),
                        crossAxisSpacing: 8,
                        childAspectRatio: 1,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return Text(
                          "${controller.allQuestions[index].selectedAnswer != null}",
                          style: TextStyle(fontSize: 20),
                        );
                      },
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
