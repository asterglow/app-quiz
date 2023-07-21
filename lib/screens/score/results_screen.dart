import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});
  static const String routeName = "/results";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("result"),
      ),
    );
  }
}