import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';
import 'package:app_flutter_quiz/screens/score/results_screen.dart';
import 'package:app_flutter_quiz/widgets/common/app_appbar.dart';
import 'package:app_flutter_quiz/widgets/common/background_decoration.dart';
import 'package:app_flutter_quiz/widgets/content_area.dart';
import 'package:app_flutter_quiz/widgets/quiz/answer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CheckAnswerScreen extends GetView<QuizController> {
  const CheckAnswerScreen({super.key});
  static const String routeName = "/check";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppAppBar(
        titleWidget: Obx(
          () => Text(
            "Q.${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}",
            style: appBarTS,
          ),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultsScreen.routeName);
        },
      ),
      body: AppBackgroundDecoration(
        child: Obx(() => Column(
              children: [
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(controller.currentQuestion.value!.question),
                          GetBuilder<QuizController>(
                            id: 'check_answer_list',
                            builder: (controller) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final _answer = controller
                                        .currentQuestion.value!.answers[index];
                                    final _selectedAnswer = controller
                                        .currentQuestion.value!.selectedAnswer;
                                    final _correctAnswer = controller
                                        .currentQuestion.value!.correctAnswer;
                                    final String _answerText =
                                        "${_answer.identifier}.${_answer.answer}";

                                    if (_correctAnswer == _selectedAnswer &&
                                        _answer.identifier == _selectedAnswer) {
                                          return CorrectAnswer(answer: _answerText);

                                    // } else if (_selectedAnswer == null) {
                                    //   return NotAnswered (answer: _answerText);  //from answer card

                                    } else if (_correctAnswer !=
                                            _selectedAnswer &&
                                        _answer.identifier == _selectedAnswer) {
                                          return WrongAnswer(answer: _answerText,);

                                    } else if (_correctAnswer ==
                                        _answer.identifier) {
                                          return CorrectAnswer(answer: _answerText);
                                        }

                                    return Answercard(
                                      amswer: _answerText,
                                      onTap: () {},
                                      isSelected: false,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length);
                            },
                          ),
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
