import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';

extension ExtQuizController on QuizController {
  int get correctQuestionsCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

      String get correctQuestions{
        return "$correctQuestionsCount Correct out of ${allQuestions.length}";
      }
}
