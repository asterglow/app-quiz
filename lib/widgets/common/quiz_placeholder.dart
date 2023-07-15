import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

class QuizPlaceholder extends StatelessWidget {
  const QuizPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    var lineC = Container(
      width: double.infinity,
      height: 12.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    var answerC = Container(
      width: double.infinity,
      height: 50.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(0.5),
      child: EasySeparatedColumn(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        children: [
          // EasySeparatedColumn(
          //   children: [
          //     lineC,
          //     lineC,
          //     lineC,
          //     lineC,
          //   ],
          //   separatorBuilder: (BuildContext context, int index) {
          //     return const SizedBox(
          //       height: 20,
          //     );
          //   },
          // ),
          answerC,
          answerC,
          answerC,
        ],
      ),
    );
  }
}
