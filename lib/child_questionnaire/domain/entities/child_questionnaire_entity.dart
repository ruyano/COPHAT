import 'package:equatable/equatable.dart';

class ChildQuestionnaireEntity extends Equatable {

  String? id;
  final String? question;
  final String? questionType;
  final List<String>? answers;

  ChildQuestionnaireEntity({
    this.id,
    this.question,
    this.questionType,
    this.answers
  });
  
  @override
  List<Object?> get props => [
    id,
    question,
    questionType,
    answers,
  ];
}
