import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/configs/themes/ui_parameters.dart';
import 'package:app_flutter_quiz/screens/score/attempts_screen.dart';
import 'package:app_flutter_quiz/widgets/circle_button.dart';
import 'package:app_flutter_quiz/widgets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  //custom default size
  const AppAppBar(
      {super.key,
      this.leading,
      this.title = "",
      this.showActionIcon = false,
      this.titleWidget,
      this.onMenuActionTap});

  final Widget? leading;
  final String title; //qn no
  final Widget? titleWidget; //optional timer
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenPadding, vertical: screenPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style: appBarTS,
                      ),
                    )
                  : Center(
                      child: titleWidget,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-10, 0), //moves child to right
                      child: const BackButton(),
                    ),
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(5, 0),
                    child: AppCircleButton(
                      onTap: onMenuActionTap?? ()=>Get.toNamed(AttemptsScreen.routeName) ,
                      child: const Icon(AppIcons.menuRight,
                      size: 30,
                      ),
                    ),
                  ),
              ],
            )
          ], 
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
