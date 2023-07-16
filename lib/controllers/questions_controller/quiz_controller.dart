import 'package:app_flutter_quiz/firebase_ref/loading_status.dart';
import 'package:app_flutter_quiz/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../firebase_ref/firebase_references.dart';

class QuizController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final List<QuestionsModel> allQuestions = <QuestionsModel>[];
  Rxn<QuestionsModel> currentQuestion =
      Rxn<QuestionsModel>(); //rxn gets updated ,getx
  // Rxn<bool> mySelector = Rxn();

  @override
  void onReady() {
    final _quizPaper = Get.arguments as QuestionPaperModel;

    print("${_quizPaper.title} clicked - Quiz Cntlr");

    loadData(_quizPaper);
    super.onReady();
  }

  void loadData(QuestionPaperModel quizModel) async {
    questionPaperModel = quizModel;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> quizQuery =
          await questionPaperRF.doc(quizModel.id).collection("questions").get();

      // print(quizQuery);

      final List<QuestionsModel> questions =
          quizQuery.docs.map((ss) => QuestionsModel.fromSnapshot(ss)).toList();
      // print(questions[0]);

      quizModel.questions = questions;

      for (QuestionsModel _question in quizModel.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPaperRF
                .doc(quizModel.id)
                .collection("questions")
                .doc(_question.id)
                .collection("answers")
                .get();

        final List<AnswersModel> answers = answersQuery.docs
            .map((ans) => AnswersModel.fromSnapshot(ans))
            .toList();

        _question.answers = answers;

        if (quizModel.questions != null && quizModel.questions!.isNotEmpty) {
          allQuestions.assignAll(quizModel.questions!);
          // print("${allQuestions.length} total questions");
          // print("quizModel.questions[1] - ${quizModel.questions![1]}");
          // print("quizModel.questions[1].qn for ${quizModel.title} is - ${quizModel.questions![1].question}");
          currentQuestion.value = quizModel.questions![0];

          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }

      // print(questionPaperModel);
    } catch (e) {
      if (kDebugMode) {
        // doesnt print in production mode, only in development
        print(e.toString());
      }
    }
  }

  void selectedAnswer(String? ans) {
    currentQuestion.value!.selectedAnswer = ans;
    update();
  }

  // void mySelectorToggle(){
  //   mySelector.value=true;
  // }

  // void hoverAnswer(String? ans){
  //   currentQuestion.value!.hoverAnswer=ans;
  //   update();
  // }
}
