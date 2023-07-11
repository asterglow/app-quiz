// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:app_flutter_quiz/firebase_ref/firebase_references.dart';
import 'package:app_flutter_quiz/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../logger/logger.dart';
import '../widgets/dialogs/dialogs.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>(); //n for null safety

  late Stream<User?> _authStateChanges; //check if user logged in

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user; //if user is logged in we get value, else nothing
    });

    navigateToIntro();
  }

  signInGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

      if (googleAccount != null) {
        final _authGoogleAccount =
            await googleAccount.authentication; //token id or google access id

        final _googleCredential = GoogleAuthProvider.credential(
            idToken: _authGoogleAccount.idToken,
            accessToken: _authGoogleAccount.accessToken);

        await _auth.signInWithCredential(_googleCredential);
        await saveGoogleUser(googleAccount);
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  saveGoogleUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  void navigateToIntro() {
    Get.offAllNamed("/intro");
  }

  void showLoginAlertDialog() {
    Get.dialog(
      AppDialogs.quizStartDialog(
        onTap: () {
          Get.back();
          navigateToLogin();
        },
      ),
      barrierDismissible: false,
    );
  }

  void navigateToLogin(){
    Get.toNamed(LoginScreen.routeName); //static variable accessed
  }

  bool isLoggedIn(){
    return _auth.currentUser != null;
  }
}
