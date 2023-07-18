import 'package:app_flutter_quiz/screens/home/question_card.dart';
import 'package:app_flutter_quiz/widgets/common/app_appbar.dart';
import 'package:app_flutter_quiz/widgets/common/background_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScoreScreen extends GetView<QuestionCard> {
  const QuizScoreScreen({super.key});
  static const String routeName = "/scorescreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Test Overview",
      ),
      body: BackgroundDecoration(
          child: Center(
        child: Text("sff"),
      )),
    );
  }
}
