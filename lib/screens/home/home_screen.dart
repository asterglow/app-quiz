// ignore_for_file: avoid_print

import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/question_paper_controller.dart';
import 'package:app_flutter_quiz/screens/home/question_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    print("allPapers1 is ${_questionPaperController.allPapers}");
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Choose your Quiz"),
      // ),

      // body:
      // Image.network('https://firebasestorage.googleapis.com/v0/b/app-flutter-quiz.appspot.com/o/question_paper_images%2Fbiology.png?alt=media&token=f2ca03aa-462a-4202-8002-fee42b5d38a2')
      // Obx(() => Image.network(_questionPaperController.allPaperImages[0])),
      body: SafeArea(
        child: Obx(
          () => ListView.separated(
            padding: UIParameters.screenPadding,
            shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                // print("allPapers2 is ${_questionPaperController.allPapers}");
                // print("allPapers[1] is ${_questionPaperController.allPapers[1]}");
                // print("allPapersImg is ${_questionPaperController.allPapers[1].id}");
                // print(
                //     "allPapers[i] is ${_questionPaperController.allPapers[index]}");
                // print(
                //     "allPapers[i]Json is ${_questionPaperController.allPapers[index].toJson()}");
                // // print(
                // //     "allPapers[i]id is ${_questionPaperController.allPapers[index].id}");
                // print(
                //     "allPapers[i]imgurl is ${_questionPaperController.allPapers[index].imageUrl}");
                return QuestionCard(
                  model: _questionPaperController.allPapers[index],
                ) ;
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
              itemCount: _questionPaperController.allPapers.length),
        ),
      ),
    );
  }
}
