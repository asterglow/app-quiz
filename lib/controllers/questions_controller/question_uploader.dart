import 'dart:convert';

import 'package:app_flutter_quiz/firebase_ref/firebase_references.dart';
import 'package:app_flutter_quiz/firebase_ref/loading_status.dart';
import 'package:app_flutter_quiz/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QuestionUploader extends GetxController {
  @override
  void onReady() {
    uploadQuestion();
    super.onReady();
  }

  final loadingstatus = LoadingStatus.loading.obs; //make it obs

  Future<void> uploadQuestion() async {
    loadingstatus.value = LoadingStatus.loading;  //value 0

    final fireStore = FirebaseFirestore.instance;

    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
    final questionsInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
    // print(questionsInAssets);
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in questionsInAssets) {
      String paperContentsString = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(paperContentsString)));
    }
    // print(paperContentsString);
    // print(questionPapers[0].description);
    var batch = fireStore.batch();

    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_link": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count":
            paper.questions == null ? 0 : paper.questions!.length,
      });

      for (var question in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: question.id);
        batch.set(questionPath, {
          "question": question.question,
          "correct_answer": question.correctAnswer,
        });

        for (var answer in question.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifier), {
            "identifier": answer.identifier,
            "answer": answer.answer,
          });
        }
      }
    }

    await batch.commit();
    loadingstatus.value = LoadingStatus.completed;
  }
}
