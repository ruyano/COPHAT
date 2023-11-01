import '../../domain/entities/guardian_question_entity.dart';

class GuardianQuestionModel extends GuardianQuestionEntity {

  GuardianQuestionModel({
    String? id,
    String? question,
    String? questionType,
    List<String>? answers,
    String? subQuestion,
    List<String>? subAnswers,
    int? position,
  }) : super(
    id: id,
    question: question,
    questionType: questionType,
    answers: answers,
    subQuestion: subQuestion,
    subAnswers: subAnswers,
    position: position,
  );

  factory GuardianQuestionModel.fromJson(Map<String, dynamic> json) {
    return GuardianQuestionModel(
      id: json['id'],
      question: json['question'],
      questionType: json['questionType'],
      answers: json['answers'] != null ? json['answers'].cast<String>() : null,
      subQuestion: json['subQuestion'],
      subAnswers: json['subAnswers'] != null ? json['subAnswers'].cast<String>() : null,
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['questionType'] = questionType;
    data['answers'] = answers;
    data['subQuestion'] = subQuestion;
    data['subAnswers'] = subAnswers;
    data['position'] = position;
    return data;
  }
}
