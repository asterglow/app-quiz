import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';
import 'package:app_flutter_quiz/firebase_ref/loading_status.dart';
import 'package:app_flutter_quiz/widgets/common/background_decoration.dart';
import 'package:app_flutter_quiz/widgets/common/quiz_placeholder.dart';
import 'package:app_flutter_quiz/widgets/content_area.dart';
import 'package:app_flutter_quiz/widgets/quiz/answer_card.dart';
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
                if (controller.loadingStatus.value == LoadingStatus.loading)
                  const Expanded(
                    child: ContentArea(child: QuizPlaceholder()),
                  ),
                if (controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(
                    child: ContentArea(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: Get.height*0.1),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: quizTextStyle,
                            ),
                            GetBuilder<QuizController>(
                              builder: (controller) {
                                return ListView.separated(
                                  shrinkWrap: true, //fixes length, to use inside another unlimited scroller
                                  padding: const EdgeInsets.only(top: 30),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];

                                    return Answercard(
                                      amswer: answer
                                          .answer!, //'${answer.identifier}.{answer.answer}'
                                      onTap: () {
                                        controller
                                            .selectedAnswer(answer.identifier);
                                        // controller.mySelector.value=true;
                                        // controller.mySelectorToggle();
                                      },
                                      isSelected: answer.identifier==controller.currentQuestion.value!.selectedAnswer,
                                    // isSelected: controller.mySelector.value!,
                                    // onHover: (p0) {
                                    //   controller.hoverAnswer(answer.identifier);
                                    // },
                                    // isHover: answer.identifier==controller.currentQuestion.value!.hoverAnswer,
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(height: 30),
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            )),
      ),
    );
  }
}
