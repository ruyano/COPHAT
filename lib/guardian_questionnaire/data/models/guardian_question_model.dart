import '../../domain/entities/guardian_question_entity.dart';

class GuardianQuestionModel extends GuardianQuestionEntity {

  GuardianQuestionModel({
    String? id,
    String? question,
    List<String>? answers,
  }) : super(
    id: id,
    question: question,
    answers: answers,
  );

  factory GuardianQuestionModel.fromJson(Map<String, dynamic> json) {
    return GuardianQuestionModel(
        id: json['id'],
        question: json['question'],
        answers: json['answers'].cast<String>()
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers;
    return data;
  }
}
