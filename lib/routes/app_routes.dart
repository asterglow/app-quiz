import 'package:app_flutter_quiz/controllers/questions_controller/question_paper_controller.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/quiz_controller.dart';
import 'package:app_flutter_quiz/controllers/zoom_drawer_controller.dart';
import 'package:app_flutter_quiz/screens/home/home_screen.dart';
import 'package:app_flutter_quiz/screens/intro/intro_screen.dart';
import 'package:app_flutter_quiz/screens/login/login_screen.dart';
import 'package:app_flutter_quiz/screens/quiz/quiz_screen.dart';
import 'package:app_flutter_quiz/screens/score/attempts_screen.dart';
import 'package:app_flutter_quiz/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/score/check_answer_screen.dart';
import '../screens/score/results_screen.dart';

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
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: QuizScreen.routeName,
          page: () => const QuizScreen(),
          binding: BindingsBuilder(() {
            Get.put<QuizController>(
                QuizController()); //specified the type as well as we are calling update() by id in page GetBuilder
          }),
        ),
        GetPage(
          name: AttemptsScreen.routeName,
          page: () => const AttemptsScreen(),
        ),
        GetPage(
          name: ResultsScreen.routeName,
          page: () => const ResultsScreen(),
        ),
        GetPage(
          name: CheckAnswerScreen.routeName,
          page: () => const CheckAnswerScreen(),
        ),
      ];
}
