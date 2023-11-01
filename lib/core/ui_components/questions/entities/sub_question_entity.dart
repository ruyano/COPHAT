import 'package:equatable/equatable.dart';

class RequestSubQuestionEntity extends Equatable {

  final String? question;
  final List<String>? answers;

  RequestSubQuestionEntity({
    this.question,
    this.answers
  });

  @override
  List<Object?> get props => [
    question,
    answers,
  ];
}
