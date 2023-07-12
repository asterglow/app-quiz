// import 'dart:html';

import 'package:app_flutter_quiz/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AppZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn(); //Firebase auth user

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void getWebsite() {
    _launch("https://github.com/asterglow");
  }

  void getInsta() {
    _launch("https://www.instagram.com/sarthakmallick");
  }

  void getEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'cybereincarnate@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }
} 

//auth controller for actual sign in, this for for zoom menu