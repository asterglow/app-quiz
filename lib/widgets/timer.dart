import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:flutter/material.dart';

class AppTimer extends StatelessWidget {
  const AppTimer({
    super.key,
    required this.color,
    required this.time,
  });

  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 5
        ),
        Text(time,
        style: timerTS().copyWith(color: color),),
      ],
    );
  }
}
