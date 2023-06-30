import 'package:app_flutter_quiz/controllers/auth_controller.dart';
import 'package:app_flutter_quiz/controllers/theme_controller.dart';
import 'package:app_flutter_quiz/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => FirebaseStorageService());
  }
  
}