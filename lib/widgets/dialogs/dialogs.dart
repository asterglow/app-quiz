import 'package:flutter/material.dart';

class AppDialogs {
  static final AppDialogs _singleton = AppDialogs._internal();
  AppDialogs._internal();

  factory AppDialogs() {
    return _singleton;
  }

  static Widget quizStartDialog({
    required VoidCallback onTap,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Hi",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text("Please lgin to continue"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onTap,
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
