import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

//   late FirebaseAuth _auth;
//   final _user = Rxn<User>(); //n for null safety

// late Stream<User>_authStateChanges; //check if user logged in


  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntro();
  }

  void navigateToIntro() {
    Get.offAllNamed("/intro");
  }
}
