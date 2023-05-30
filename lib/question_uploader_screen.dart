import 'package:app_flutter_quiz/controllers/questions_controller/question_uploader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionUploaderScreen extends StatelessWidget {
  QuestionUploaderScreen({super.key});
  QuestionUploader questionController = Get.put(QuestionUploader());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Uploading Questions ...',
        ),
      ),
    );
  }
}
