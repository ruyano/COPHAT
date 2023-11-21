import 'package:cophat/core/models/question_model.dart';
import 'package:cophat/core/models/single_answer_model.dart';

import '../question_type.dart';

class AnswersModel {
  String? id;
  DateTime? date;
  List<QuestionModel>? questions;
  List<SingleAnswerModel>? answers;

  AnswersModel({this.id, this.date, this.questions, this.answers});

  AnswersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date']?.toDate();
    if (json['questions'] != null) {
      questions = <QuestionModel>[];
      json['questions'].forEach((v) {
        questions!.add(QuestionModel.fromJson(v));
      });
    }
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
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int getValueByQuestionType(QuestionType type) {
    int value = 0;

    questions?.asMap().forEach((index, element) {
      if(element.questionType == type.label) {
        var resposta = answers?[index].singleAnswer;
        var posicaoDaResposta = element.answers?.indexOf(resposta!);
        value += posicaoDaResposta ?? 0;
      }
    });

    return value;
  }
  
}
