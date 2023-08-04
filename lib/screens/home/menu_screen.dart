import 'package:app_flutter_quiz/configs/themes/app_colors.dart';
import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:app_flutter_quiz/controllers/zoom_drawer_controller.dart';
import 'package:app_flutter_quiz/screens/contact/contact_screen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomeMenuScreen extends GetView<AppZoomDrawerController> {
  const HomeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.screenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor: onSurfaceTextColor))),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    // print("back pressed");
                    controller.toggleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  children: [
                    Obx(() => controller.user.value == null
                        ? Container()
                        : controller.user.value!.photoURL == null ||
                                controller.user.value!.photoURL!.isEmpty
                            ? Image.asset("assets/images/app_splash_logo.png")
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    controller.user.value!.photoURL!),
                              )),
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(controller.user.value!.displayName ?? "",
                              style: headerTextStyle),
                    ),
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(controller.user.value!.email ?? "",
                              style: detailTextStyle),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    _DrawerButton(
                      icontype: Icons.currency_rupee,
                      txt: "Upgrade to Premium",
                      onTap: () {},
                      arrow: true,
                    ),
                    const SizedBox(height: 15),
                    _DrawerButton(
                      icontype: Icons.history,
                      txt: "My Test History",
                      // onTap: () => controller.getWebsite(),
                      arrow: true,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 30,
                          color: Colors.white,
                        ),
                        const Text(
                          'Theme',
                          style: quizTextStyle,
                        ),
                        LiteRollingSwitch(
                          value: true,
                          width: Get.width * 0.35,
                          animationDuration: const Duration(milliseconds: 150),
                          textOff: 'Light   ',
                          textOn: '    Dark',
                          textOnColor: Colors.white60,
                          textOffColor: Colors.white,
                          colorOff: Colors.orange,
                          colorOn: Colors.black54,
                          iconOff: Icons.sunny,
                          iconOn: Icons.nightlight_round_sharp,
                          textSize: 14,
                          onChanged: (bool thm) {
                            Get.changeThemeMode(thm
                                ? ThemeMode.dark
                                : ThemeMode.light);
                          },
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                        ),
                      ],
                    ),
                    MaterialButton(
                      color: Colors.white,
                      onPressed: () => Get.changeThemeMode(
                          Get.isDarkMode ? ThemeMode.dark : ThemeMode.light),
                      child: Text("ThemeTog"),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 30,
                          color: Colors.white,
                        ),
                        const Text(
                          'Sound',
                          style: quizTextStyle,
                        ),
                        LiteRollingSwitch(
                          value: true,
                          animationDuration: Duration(milliseconds: 150),
                          textOn: '    On',
                          textOff: '   Muted',
                          textOnColor: Colors.white,
                          textOffColor: Colors.white,
                          colorOff: Colors.redAccent,
                          colorOn: Colors.green,
                          iconOn: Icons.alarm_off_sharp,
                          iconOff: Icons.done_sharp,
                          textSize: 14,
                          onChanged: (bool snd) {
                            // print('sound $snd');
                          },
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 12,
                    ),
                    _DrawerButton(
                      icontype: Icons.email,
                      txt: "Email & Support",
                      // onTap: () => controller.getEmail(),
                      arrow: false,
                    ),
                    const SizedBox(height: 15),
                    _DrawerButton(
                      icontype: Icons.email,
                      txt: "About Us",
                      // onTap: () => Get.toNamed(ContactScreen.routeName),
                      arrow: false,
                    ),
                    const SizedBox(height: 15),
                    _DrawerButton(
                      icontype: Icons.logout,
                      txt: "Log out",
                      onTap: () => controller.signOut(),
                      arrow: false,
                    ),
                  ],
                ),
              )
            ],
          ))),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {super.key,
      required this.txt,
      required this.arrow,
      required this.icontype,
      this.onTap});

  final String txt;
  final bool arrow;
  final IconData icontype;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(9),
          height: Get.height * 0.05,
          width: Get.width * 0.85,
          decoration: BoxDecoration(
            color: UIParameters.isDarkMode() ? Colors.white : Colors.blueGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icontype,
                size: 25,
                color: UIParameters.isDarkMode()
                    ? menuIconColorDark
                    : menuIconColorLight,
                shadows: const [Shadow(blurRadius: 1)],
              ),
              SizedBox(
                // width: 50,
                child:
                    Text(txt, textAlign: TextAlign.start, style: quizTextStyle),
              ),
              arrow
                  ? Icon(
                      Icons.forward,
                      color: UIParameters.isDarkMode()
                          ? menuIconColorDark
                          : menuIconColorLight,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
