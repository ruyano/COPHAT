part of 'child_questionnaire_bloc.dart';

abstract class ChildQuestionnaireState extends Equatable {
  const ChildQuestionnaireState();

  @override
  List<Object?> get props => [];
}


class ChildQuestionnaireEmpty extends ChildQuestionnaireState {

  const ChildQuestionnaireEmpty();

  @override
  List<Object?> get props => [];
}

class ChildQuestionnaireLoading extends ChildQuestionnaireState {

  const ChildQuestionnaireLoading();

  @override
  List<Object?> get props => [];
}

class ChildQuestionnaireSuccess extends ChildQuestionnaireState {

  final List<QuestionEntity>? questionsList;

  const ChildQuestionnaireSuccess({
    this.questionsList
  });

  @override
  List<Object?> get props => [
    questionsList
  ];
}

class CreateOrUpdateOrDeleteSuccess extends ChildQuestionnaireState {

  const CreateOrUpdateOrDeleteSuccess();

  @override
  List<Object?> get props => [];
}

class ChildQuestionnaireError extends ChildQuestionnaireState {

  final String message;

  const ChildQuestionnaireError( this.message, );

  @override
  List<Object?> get props => [
    message,
  ];
}

