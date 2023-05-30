import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QuestionUploader extends GetxController {
  @override
  void onReady() {
    uploadQuestion();
    super.onReady();
  }

  Future<void> uploadQuestion() async {
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
    final questionsInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
    // print(questionsInAssets);
    for (var paper in questionsInAssets) {
      String paperContentsString = await rootBundle.loadString(paper);
    }
    // print(paperContentsString);
  }
}
