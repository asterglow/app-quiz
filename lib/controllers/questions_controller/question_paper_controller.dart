// ignore_for_file: avoid_print

import 'package:app_flutter_quiz/firebase_ref/firebase_references.dart';
import 'package:app_flutter_quiz/models/question_paper_model.dart';
import 'package:app_flutter_quiz/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  // final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs; 

  @override
  void onReady() {
    getAllPaperImages();
    super.onReady();
  }

  Future<void> getAllPaperImages() async {
    // List<String> imgName = ["biology", "chemistry", "maths", "physics"];

    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      // print("data.docs is ${data.docs}");
      final List<QuestionPaperModel> paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
         
          // print(paperList[1]);
      allPapers.assignAll(paperList);
      // print(allPapers); //papers from Firestore Snapshots to QPModel

      for (var paper in paperList) {
        // print("paper.title is ${paper.title}");
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
            // print("QP imgurl is ${imgUrl}");
        
        // allPaperImages.add(imgUrl!);
        
        paper.imageUrl = imgUrl; //corresponding title matched with saved Firebase Storage image and added to QPModel 
      }
      allPapers.assignAll(paperList); //replace any older values
      // final imgUrl =
      //     await Get.find<FirebaseStorageService>().getImage(imgName[0]);

      // print("imgUrl is $imgUrl");
      // allPaperImages.add(imgUrl!);
      // print("test3");
      // print(allPaperImages);
    } catch (e) {
      print(e.toString());
    }
  }
}
