import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/models/question_paper_model.dart';
import 'package:app_flutter_quiz/widgets/icon_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 5.0;
    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: SizedBox(
                    height: Get.height * 0.15,
                    width: Get.height * 0.15,
                    // child: _questionPaperController.allPapers[index].imageUrl ==
                    //             null ||
                    //         _questionPaperController
                    //             .allPapers[index].imageUrl!.isEmpty
                    //     ? null
                    //     : Image.network(_questionPaperController
                    //         .allPapers[index].imageUrl!),

                    child: model.imageUrl == null || model.imageUrl!.isEmpty
                        ? null
                        : CachedNetworkImage(
                            imageUrl: model.imageUrl!,
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child:
                                  const CircularProgressIndicator(), //add preloader image later
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                                "assets/images/app_splash_logo.png"),
                          ),

                    // child: FadeInImage(
                    //   placeholder:
                    //       AssetImage("assets/images/app_splash_logo.png"),
                    //   image: NetworkImage(
                    //       _questionPaperController.allPaperImages[index]),
                    // ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title, style: quizTitleTextStyle(context)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(model.description),
                    ),
                    Row(
                      children: [
                        IconText(
                          icon: Icon(
                            Icons.help_outline_sharp,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                          ),
                          text: Text(
                            "${model.questionsCount} Questions",
                            style: detailTextStyle.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                          ),
                        ),
                        SizedBox(width: 15),
                        IconText(
                          icon: Icon(
                            Icons.timer,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                          ),
                          text: Text(
                            model.timeMins(),
                            style: detailTextStyle.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
