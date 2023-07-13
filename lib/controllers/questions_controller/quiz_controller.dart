import 'package:app_flutter_quiz/models/question_paper_model.dart';
import 'package:get/get.dart';

class QuizController extends GetxController{
  late QuestionPaperModel questionPaperModel;

  @override
  void onReady(){
final _quizPaper = Get.arguments as QuestionPaperModel;
print("${_quizPaper.title} clicked - Quiz Cntlr");
loadData(_quizPaper);
    super.onReady();
  }
}

void loadData(QuestionPaperModel quizModel){

}