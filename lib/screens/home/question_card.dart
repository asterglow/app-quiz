import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/question_paper_controller.dart';
import 'package:app_flutter_quiz/models/question_paper_model.dart';
import 'package:app_flutter_quiz/widgets/icon_text.dart';
import 'package:app_flutter_quiz/widgets/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {

          // print("${model.title} clicked - Card");
          controller.navigateToQuiz(
            paper: model,
            tryAgain: false,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Stack(
            clipBehavior: Clip.none,
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
                                errorWidget: (context, url, error) =>
                                    Image.asset(
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
              ),
              Positioned(
                bottom: -_padding,
                right: -2 * _padding,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(cardBorderRadius),
                          topLeft: Radius.circular(cardBorderRadius)),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Icon(
                      AppIcons.trophy,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
