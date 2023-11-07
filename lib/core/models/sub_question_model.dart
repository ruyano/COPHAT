import '../entities/sub_question_entity.dart';

class SubQuestionModel extends SubQuestionEntity {

  SubQuestionModel({
    String? question,
    List<String>? answers,
    String? answerType,
  }) : super(
    question: question,
    answers: answers,
    answerType: answerType,
  );

  factory SubQuestionModel.fromJson(Map<String, dynamic> json) {
    return SubQuestionModel(
      question: json['question'],
      answers: json['answers']?.cast<String>(),
      answerType: json['answerType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answers'] = answers;
    data['answerType'] = answerType;
    return data;
  }
}