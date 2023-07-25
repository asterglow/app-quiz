import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../firebase_ref/firebase_references.dart';
import '../auth_controller.dart';

extension ExtQuizController on QuizController {
  int get correctQuestionsCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctQuestions {
    return "$correctQuestionsCount Correct out of ${allQuestions.length}";
  }

  double get points {
    return correctQuestionsCount - (noAnswered - correctQuestionsCount) / 4;
  }

  String get pointsCalc =>
      "${correctQuestionsCount} - (0.25 * ${noAnswered - correctQuestionsCount}) =";

  void allScores() {
    int wrongCount = noAnswered - correctQuestionsCount;
    double timeScore = (questionPaperModel.timeSeconds - secsLeft) / 100;
  }

  Future<void> saveTestResult() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();
    if (_user == null) return;
    batch.set(
        userRF
            .doc(_user.email)
            .collection('my_recent_tests')
            .doc(questionPaperModel.id),
        {
          "points": pointsCalc,
          "correct_answers": '$correctQuestionsCount/${allQuestions.length}',
          "question_id": questionPaperModel.id,
          "time": questionPaperModel.timeSeconds - secsLeft
        });
        batch.commit();
        navigateToHome();
  }
}
