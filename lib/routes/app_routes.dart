import 'package:app_flutter_quiz/screens/intro/intro_screen.dart';
import 'package:app_flutter_quiz/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/intro", page: () => IntroScreen()),
      ];
}
