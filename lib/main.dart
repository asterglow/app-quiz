import 'package:app_flutter_quiz/firebase_options.dart';
import 'package:app_flutter_quiz/question_uploader_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future <void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);  
  runApp(GetMaterialApp(
    home: QuestionUploaderScreen(),
  ));
}


