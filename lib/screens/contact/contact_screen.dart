import 'package:app_flutter_quiz/configs/themes/textstyles.dart';
import 'package:app_flutter_quiz/screens/home/home_screen.dart';
import 'package:app_flutter_quiz/screens/intro/intro_screen.dart';
import 'package:app_flutter_quiz/widgets/common/app_appbar.dart';
import 'package:app_flutter_quiz/widgets/common/background_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
   const ContactScreen({super.key});

  static const String routeName = "/contact";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppAppBar(
        title: 'Contact Details' ,
        // showActionIcon: true,
        // onMenuActionTap:() => Get.offAndToNamed(Intro,
      ),
      body: AppBackgroundDecoration(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('   AsterGlow Inc.',
              style: headerTextStyle,),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('335, City Garden\nBhubaneswar\nINDIA-751024\n\n+91-9437-707-000',
                style: appBarTS,),
              )
            ],
          ),
        ),
      ),
    );
  }
}