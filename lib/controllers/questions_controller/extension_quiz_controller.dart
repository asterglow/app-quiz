import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';

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

  String get pointsCalc=>
  "${correctQuestionsCount} - (0.25 * ${noAnswered - correctQuestionsCount}) =";

void allScores(){
  int wrongCount=noAnswered - correctQuestionsCount;
  double timeScore= (questionPaperModel.timeSeconds - secsLeft)/100;
}
}
