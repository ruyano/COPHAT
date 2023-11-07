import 'package:cophat/core/models/single_answer_model.dart';

class AnswersModel {
  String? id;
  DateTime? date;
  List<SingleAnswerModel>? answers;

  AnswersModel({this.id, required this.date, this.answers});

  AnswersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date']?.toDate();
    if (json['answers'] != null) {
      answers = <SingleAnswerModel>[];
      json['answers'].forEach((v) {
        answers!.add(SingleAnswerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
