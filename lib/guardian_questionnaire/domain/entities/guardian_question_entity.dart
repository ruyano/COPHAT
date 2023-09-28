import 'package:equatable/equatable.dart';

class GuardianQuestionEntity extends Equatable {

  String? id;
  final String? question;
  final String? questionType;
  final List<String>? answers;

  GuardianQuestionEntity({
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
