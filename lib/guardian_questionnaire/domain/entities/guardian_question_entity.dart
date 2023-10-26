import 'package:equatable/equatable.dart';

class GuardianQuestionEntity extends Equatable {

  String? id;
  final String? question;
  final String? questionType;
  final List<String>? answers;
  final String? subQuestion;
  final List<String>? subAnswers;

  GuardianQuestionEntity({
    this.id,
    this.question,
    this.questionType,
    this.answers,
    this.subQuestion,
    this.subAnswers,
  });

  @override
  List<Object?> get props => [
    id,
    question,
    questionType,
    answers,
    subQuestion,
    subAnswers,
  ];
}
