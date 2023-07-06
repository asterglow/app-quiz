// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class QuestionCard extends StatelessWidget {
//   const QuestionCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Row( children: [
//           ClipRect(
//                 child: SizedBox(
//                   height: 200,
//                   width: 200,
//                   child: CachedNetworkImage(
//                     imageUrl:
//                         _questionPaperController.allPapers[index].imageUrl!,
//                     placeholder: (context, url) => Container(
//                       alignment: Alignment.center,
//                       child:
//                           const CircularProgressIndicator(), 
//                     ),
//                     errorWidget: (context, url, error) =>
//                         Image.asset("assets/images/app_splash_logo.png"),
//                   ),
//                 ),
//               ),
//         ],)
//       ],
//     );
//   }
// }