import 'package:equatable/equatable.dart';

class GuardianQuestionEntity extends Equatable {

  String? id;
  final String? question;
  final List<String>? answers;

  GuardianQuestionEntity({
    this.id,
    this.question,
    this.answers
  });

  @override
  List<Object?> get props => [
    id,
    question,
    answers,
  ];
}
