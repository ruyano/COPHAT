import '../../domain/entities/patient_entity.dart';

class PatientModel extends PatientEntity {

  PatientModel({
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

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
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
