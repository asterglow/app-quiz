import 'package:app_flutter_quiz/bindings/initial_bindings.dart';
import 'package:app_flutter_quiz/controllers/theme_controller.dart';
import 'package:app_flutter_quiz/firebase_options.dart';
import 'package:app_flutter_quiz/question_uploader_screen.dart';
import 'package:app_flutter_quiz/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(
//     home: QuestionUploaderScreen(),
//   ));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      darkTheme: Get.find<ThemeController>().darkTheme,
      themeMode: ThemeController().getTheme(),
      getPages: AppRoutes.routes(),
    );
  }
}
