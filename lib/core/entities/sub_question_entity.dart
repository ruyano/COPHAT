import 'package:equatable/equatable.dart';

class SubQuestionEntity extends Equatable {

  final String? question;
  final List<String>? answers;
  final String? answerType;

  SubQuestionEntity({
    this.question,
    this.answers,
    this.answerType,
  });

  @override
  List<Object?> get props => [
    question,
    answers,
    answerType,
  ];
}
