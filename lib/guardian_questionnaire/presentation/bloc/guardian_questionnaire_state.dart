part of 'guardian_questionnaire_bloc.dart';

abstract class GuardianQuestionnaireState extends Equatable {
  const GuardianQuestionnaireState();

  @override
  List<Object?> get props => [];
}


class GuardianQuestionnaireEmpty extends GuardianQuestionnaireState {

  const GuardianQuestionnaireEmpty();

  @override
  List<Object?> get props => [];
}

class GuardianQuestionnaireLoading extends GuardianQuestionnaireState {

  const GuardianQuestionnaireLoading();

  @override
  List<Object?> get props => [];
}

class GuardianQuestionnaireSuccess extends GuardianQuestionnaireState {

  final List<QuestionEntity>? questionsList;

  const GuardianQuestionnaireSuccess({
    this.questionsList
  });

  @override
  List<Object?> get props => [
    questionsList
  ];
}

class CreateOrUpdateOrDeleteSuccess extends GuardianQuestionnaireState {

  const CreateOrUpdateOrDeleteSuccess();

  @override
  List<Object?> get props => [];
}

class GuardianQuestionnaireError extends GuardianQuestionnaireState {

  final String message;

  const GuardianQuestionnaireError( this.message, );

  @override
  List<Object?> get props => [ this.message, ];
}

