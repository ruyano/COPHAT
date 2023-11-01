import 'package:equatable/equatable.dart';

class GuardianQuestionEntity extends Equatable {

  String? id;
  final String? question;
  final String? questionType;
  final List<String>? answers;
  final String? subQuestion;
  final List<String>? subAnswers;
  final int? position;

  GuardianQuestionEntity({
    this.id,
    this.question,
    this.questionType,
    this.answers,
    this.subQuestion,
    this.subAnswers,
    this.position,
  });

  @override
  List<Object?> get props => [
    id,
    question,
    questionType,
    answers,
    subQuestion,
    subAnswers,
    position,
  ];
}
