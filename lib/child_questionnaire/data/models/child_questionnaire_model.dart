import '../../domain/entities/child_questionnaire_entity.dart';

class ChildQuestionnaireModel extends ChildQuestionnaireEntity {

  ChildQuestionnaireModel({
      String? id,
      String? question,
      String? questionType,
      List<String>? answers,
    }) : super(
      id: id,
      question: question,
      questionType: questionType,
      answers: answers,
  );

  factory ChildQuestionnaireModel.fromJson(Map<String, dynamic> json) {
    return ChildQuestionnaireModel(
      id: json['id'],
      question: json['question'],
      questionType: json['questionType'],
      answers: json['answers'].cast<String>()
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['questionType'] = questionType;
    data['answers'] = answers;
    return data;
  }

}
