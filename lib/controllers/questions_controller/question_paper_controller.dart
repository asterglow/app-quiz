// ignore_for_file: avoid_print

import 'package:app_flutter_quiz/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;

  @override
  void onReady() {
    getAllPaperImages();
    super.onReady();
  }

  Future<void> getAllPaperImages() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];

    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages.add(imgUrl!);

      }

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
