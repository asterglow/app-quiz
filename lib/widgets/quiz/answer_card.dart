import 'package:app_flutter_quiz/configs/themes/app_colors.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

enum AnswerStatus { answered, notanswered, correct, wrong }

class Answercard extends StatelessWidget {
  final String amswer;
  final bool isSelected;
  final VoidCallback onTap;
  // bool heightBool;
  // final bool isHover;
  // final Function(bool)? onHover;

  const Answercard({
    super.key,
    required this.amswer,
    this.isSelected = false,
    required this.onTap,
    // this.heightBool=false,
    // this.isHover=false,
    // this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      // onHover: (isHovering) {
      //   if (isHovering) {
      //     heightBool = !heightBool;
      //   }
      // },
      // onHover: onHover,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color:
              isSelected ? answerSelectedColor() : Theme.of(context).cardColor,
          border: Border.all(
            color: isSelected ? answerSelectedColor() : answerBorderColor(),
          ),
        ),
        child: Text(
          amswer,
          style: TextStyle(
              color: isSelected ? onSurfaceTextColor : null,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: correctAnsColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        answer,
        style: const TextStyle(
          color: correctAnsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: correctAnsColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        answer,
        style: const TextStyle(
          color: wrongAnsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  const NotAnswered({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: correctAnsColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        answer,
        style: const TextStyle(
          color: notAnsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
