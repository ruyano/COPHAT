import 'package:equatable/equatable.dart';

import '../models/sub_question_model.dart';

class QuestionEntity extends Equatable {

  String? id;
  final String? question;
  final String? questionType;
  final String? answerType;
  final List<String>? answers;
  final SubQuestionModel? subQuestion;
  final int? position;

  QuestionEntity({
    this.id,
    this.question,
    this.questionType,
    this.answerType,
    this.answers,
    this.subQuestion,
    this.position,
  });

  @override
  List<Object?> get props => [
    id,
    question,
    questionType,
    answerType,
    answers,
    subQuestion,
    position,
  ];
}
