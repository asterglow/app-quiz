import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<QuestionsModel>? questions;
  int questionsCount;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questionsCount,
      this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['Description'] as String,
        timeSeconds = json['time_seconds'],
        questionsCount = 0, //doesn't matter here
        questions = (json['questions'] as List)
            .map((dynamic e) =>
                QuestionsModel.fromJson(e as Map<String, dynamic>))
            .toList();

  QuestionPaperModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) //from Firebase
      : id = json.id, //any format
        title = json['title'],
        imageUrl = json['image_link'],
        description = json['description'],
        timeSeconds = json['time_seconds'],
        questionsCount = json['questions_count'] as int,
        questions = []; //not needed here , hence empty list

  String timeMins() => "${(timeSeconds / 60).ceil()} Mins";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;

    return data;
  }
}

class QuestionsModel {
  String id;
  String question;
  List<AnswersModel> answers;
  String? correctAnswer;

  QuestionsModel(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  QuestionsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        question = json['question'] as String,
        answers = (json["answers"] as List)
            .map((e) => AnswersModel.fromJson(e))
            .toList(),
        correctAnswer = json['correct_answer'] as String;

  QuestionsModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'] as String,
        answers = [],
        correctAnswer = snapshot['correct_answer'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class AnswersModel {
  String? identifier;
  String? answer;

  AnswersModel({this.identifier, this.answer});

  AnswersModel.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'] as String,
        answer = json['Answer'] as String;

  AnswersModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> ss)
      : identifier = ss['identifier'] as String,
        answer = ss['answer'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}
