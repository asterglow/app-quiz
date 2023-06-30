import 'package:app_flutter_quiz/controllers/questions_controller/question_paper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      // body: 
      // Image.network('https://firebasestorage.googleapis.com/v0/b/app-flutter-quiz.appspot.com/o/question_paper_images%2Fbiology.png?alt=media&token=f2ca03aa-462a-4202-8002-fee42b5d38a2')
          // Obx(() => Image.network(_questionPaperController.allPaperImages[0])),
      body: Obx(
        () => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ClipRect(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                      placeholder:
                          AssetImage("assets/images/app_splash_logo.png"),
                      image: NetworkImage(
                          _questionPaperController.allPaperImages[index])),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPaperImages.length),
      ),
    );
  }
}
