import 'package:cophat/core/models/sub_question_model.dart';

import '../entities/question_entity.dart';

class QuestionModel extends QuestionEntity {

  QuestionModel({
    String? id,
    String? question,
    String? questionType,
    String? answerType,
    List<String>? answers,
    SubQuestionModel? subQuestion,
    int? position,
  }) : super(
    id: id,
    question: question,
    questionType: questionType,
    answerType: answerType,
    answers: answers,
    subQuestion: subQuestion,
    position: position,
  );

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    try {
      return QuestionModel(
        id: json['id'],
        question: json['question'],
        questionType: json['questionType'],
        answerType: json['answerType'],
        answers: json['answers']?.cast<String>(),
        subQuestion: json['subQuestion'] != null
            ? SubQuestionModel.fromJson(json['subQuestion'])
            : null,
        position: json['position'],
      );
    } catch(e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['questionType'] = questionType;
    data['answerType'] = answerType;
    data['answers'] = answers;
    if (subQuestion != null) {
      data['subQuestion'] = subQuestion!.toJson();
    }
    data['position'] = position;
    return data;
  }

}
