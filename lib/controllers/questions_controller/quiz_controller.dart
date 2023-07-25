import 'dart:async';

import 'package:app_flutter_quiz/controllers/auth_controller.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/question_paper_controller.dart';
import 'package:app_flutter_quiz/firebase_ref/loading_status.dart';
import 'package:app_flutter_quiz/models/question_paper_model.dart';
import 'package:app_flutter_quiz/screens/home/home_screen.dart';
import 'package:app_flutter_quiz/screens/score/results_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final RxInt questionIndex = 0.obs;
  bool get isNotFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;

  Timer? _timer;
  int secsLeft = 1;
  final time = '0.00'.obs;

  @override
  void onReady() {
    final _quizPaper = Get.arguments as QuestionPaperModel;

    // print("${_quizPaper.title} clicked - Quiz Cntlr");
    // print("onReady fetched...");

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
      }
      // print(questionPaperModel);
    } catch (e) {
      if (kDebugMode) {
        // doesnt print in production mode, only in development
        print(e.toString());
      }
    }

    if (quizModel.questions != null && quizModel.questions!.isNotEmpty) {
      allQuestions.assignAll(quizModel.questions!);
      // if(kDebugMode){
      // print("${allQuestions.length} total questions");
      // print("quizModel.questions[1] - ${quizModel.questions![1]}");
      // print("quizModel.questions[1].qn for ${quizModel.title} is - ${quizModel.questions![1].question}");
      // }
      currentQuestion.value = quizModel.questions![0];

      _startTimer(quizModel.timeSeconds);
      //  print("startTimer started...");

      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void selectedAnswer(String? ans) {
    currentQuestion.value!.selectedAnswer = ans;
    update(['quiz_screen_listview', 'check_answer_list']); //which Getbuilder to update
  }

  int get noAnswered => allQuestions
      .where((element) => element.selectedAnswer != null)
      .toList()
      .length;

  void jumpToQuestion(int index, {bool isGoBack = true}) {
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if (isGoBack == true) {
      Get.back();
    }
  }

  // void mySelectorToggle(){
  //   mySelector.value=true;
  // }

  // void hoverAnswer(String? ans){
  //   currentQuestion.value!.hoverAnswer=ans;
  //   update();
  // }

  void nextQuestion() {
    if (isLastQuestion) {
      return;
    } else {
      questionIndex.value++;
      currentQuestion.value = allQuestions[questionIndex.value];
    }
  }

  void previousQuestion() {
    if (!isNotFirstQuestion) {
      return;
    } else {
      questionIndex.value--;
      currentQuestion.value = allQuestions[questionIndex.value];
    }
  }

  _startTimer(int secs) {
    const duratn = Duration(seconds: 1);
    secsLeft = secs;
    _timer = Timer.periodic(duratn, (Timer timer) {
      if (secsLeft == 0) {
        timer.cancel();
      } else {
        int minsDisplay = (secsLeft / 60).floor();
        int secsDisplay = secsLeft % 60;
        time.value = minsDisplay.toString().padLeft(2, "0") +
            ":" +
            secsDisplay.toString().padLeft(2, "0");
        secsLeft--; //every 1 sec duratn
      }
    });
  }

  void completeTest() {
    _timer!.cancel();
    Get.offAndToNamed(ResultsScreen.routeName);
  }

  void tryAgain() {
    Get.find<QuestionPaperController>().navigateToQuiz(
      paper: questionPaperModel,
      tryAgain: true,
    );
  }

  void navigateToHome(){
    _timer!.cancel();
    Get.offNamedUntil(HomeScreen.routeName, (route) => false);
  }
}
