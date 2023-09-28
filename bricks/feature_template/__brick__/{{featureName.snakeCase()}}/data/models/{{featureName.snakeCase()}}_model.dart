import '../../domain/entities/{{featureName.snakeCase()}}_entity.dart';

class {{featureName.pascalCase()}}Model extends {{featureName.pascalCase()}}Entity {

  {{featureName.pascalCase()}}Model({
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

  factory {{featureName.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{featureName.pascalCase()}}Model(
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
