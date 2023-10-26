import 'package:cophat/core/ui_components/request_model/request_sub_question_entity.dart';
import 'package:equatable/equatable.dart';

class RequestQuestionEntity extends Equatable {

  String? id;
  final String? question;
  final String? questionType;
  final List<String>? answers;
  RequestSubQuestionEntity? subQuestion;

  RequestQuestionEntity({
    this.id,
    this.question,
    this.questionType,
    this.answers,
    this.subQuestion,
  });

  @override
  List<Object?> get props => [
    id,
    question,
    questionType,
    answers,
    subQuestion,
  ];
}
