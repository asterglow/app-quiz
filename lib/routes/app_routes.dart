import 'package:app_flutter_quiz/controllers/questions_controller/question_paper_controller.dart';
import 'package:app_flutter_quiz/controllers/zoom_drawer_controller.dart';
import 'package:app_flutter_quiz/screens/home/home_screen.dart';
import 'package:app_flutter_quiz/screens/intro/intro_screen.dart';
import 'package:app_flutter_quiz/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../services/firebase_storage_service.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
        ),
        GetPage(
            name: "/intro",
            page: () => const IntroScreen(),
            transition: Transition.downToUp),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            // Get.lazyPut(() => FirebaseStorageService());
            // Get.put(FirebaseStorageService());
            Get.put(AppZoomDrawerController());
          }),
        ),
      ];
}
