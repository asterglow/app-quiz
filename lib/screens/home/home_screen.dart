// ignore_for_file: avoid_print

import 'package:app_flutter_quiz/configs/themes/app_colors.dart';
import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:app_flutter_quiz/controllers/questions_controller/question_paper_controller.dart';
import 'package:app_flutter_quiz/controllers/zoom_drawer_controller.dart';
import 'package:app_flutter_quiz/screens/home/menu_screen.dart';
import 'package:app_flutter_quiz/screens/home/question_card.dart';
import 'package:app_flutter_quiz/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/content_area.dart';
import '../../widgets/icons.dart';

class HomeScreen extends GetView<AppZoomDrawerController> {
  const HomeScreen({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    // print("allPapers1 is ${_questionPaperController.allPapers}");
    return Scaffold(
      body: GetBuilder<AppZoomDrawerController>(
        builder: (controller) {
          return ZoomDrawer(
            controller: controller.zoomDrawerController,
            borderRadius: 50.0,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            menuBackgroundColor: Colors.white.withOpacity(0.5),
            slideWidth: MediaQuery.of(context).size.width * 0.85,
            menuScreen: HomeMenuScreen(),
            mainScreen: Container(
              // color: Colors.blueAccent,
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCircleButton(
                            child: const Icon(AppIcons.menuLeft),
                            onTap: () => controller.toggleDrawer(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(AppIcons.highFive),
                                Builder(
                                  builder: (_) {
                                    final AuthController _auth = Get.find();
                                    final user = _auth.getUser();
                                    String _label = '  ନମସ୍କାର';
                                    if (user != null) {
                                      List<String> splitName =user.displayName!.split(" ");
                                      _label = '  Hello ${splitName[0]}';
                                    }
                                    return Text(
                                      _label,
                                      style: detailTextStyle.copyWith(
                                          color: onSurfaceTextColor),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                            "ଆଜି କୋଉ ବିଷୟରେ ପଢିବା?",
                            style: headerTextStyle.copyWith(fontWeight: FontWeight.w400)
                                // headerTextStyle.copyWith(fontFamily: 'Kalinga'),
                          ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ContentArea(
                          addPadding: false, //use Expanded above
                          child: Obx(
                            () => ListView.separated(
                                padding: UIParameters.screenPadding,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  // print("allPapers2 is ${_questionPaperController.allPapers}");
                                  // print("allPapers[1] is ${_questionPaperController.allPapers[1]}");
                                  // print("allPapersImg is ${_questionPaperController.allPapers[1].id}");
                                  // print(
                                  //     "allPapers[i] is ${_questionPaperController.allPapers[index]}");
                                  // print(
                                  //     "allPapers[i]Json is ${_questionPaperController.allPapers[index].toJson()}");
                                  // // print(
                                  // //     "allPapers[i]id is ${_questionPaperController.allPapers[index].id}");
                                  // print(
                                  //     "allPapers[i]imgurl is ${_questionPaperController.allPapers[index].imageUrl}");
                                  return QuestionCard(
                                    model: _questionPaperController
                                        .allPapers[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 20);
                                },
                                itemCount:
                                    _questionPaperController.allPapers.length),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // backgroundColor: Colors.blueAccent,

              // appBar: AppBar(
              //   title: const Text("Choose your Quiz"),
              // ),

              // body:
              // Image.network('https://firebasestorage.googleapis.com/v0/b/app-flutter-quiz.appspot.com/o/question_paper_images%2Fbiology.png?alt=media&token=f2ca03aa-462a-4202-8002-fee42b5d38a2')
              // Obx(() => Image.network(_questionPaperController.allPaperImages[0])),
            ),
          );
        },
      ),
    );
  }
}
