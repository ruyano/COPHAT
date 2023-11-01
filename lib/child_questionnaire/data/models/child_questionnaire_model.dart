import '../../domain/entities/child_questionnaire_entity.dart';

class ChildQuestionnaireModel extends ChildQuestionnaireEntity {

  ChildQuestionnaireModel({
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
    position: position
  );

  factory ChildQuestionnaireModel.fromJson(Map<String, dynamic> json) {
    return ChildQuestionnaireModel(
      id: json['id'],
      question: json['question'],
      questionType: json['questionType'],
      answers: json['answers']?.cast<String>(),
      subQuestion: json['subQuestion'],
      subAnswers: json['subAnswers']?.cast<String>(),
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
