// import 'dart:html';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AppZoomDrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController(); 

  @override
void onReady(){
// get user from firebase
  super.onReady();
}

  void toggleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut(){
// firebase google signout
  }

  void signIn(){

  }

  void getWebsite(){
// String ws= "https://github.com/asterglow ";
  }

  void getEmail(){
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'cybereincarnate@gmail.com',
);
_launch(emailLaunchUri.toString());
  }

Future<void> _launch(String url) async{
if ( !await launch(url)){
  throw 'could not launch $url';
}
}

} 

//auth controller for actual sign in, this for for zoom menu