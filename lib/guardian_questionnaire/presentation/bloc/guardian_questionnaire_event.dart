part of 'guardian_questionnaire_bloc.dart';

abstract class GuardianQuestionnaireEvent extends Equatable {

  const GuardianQuestionnaireEvent();

  @override
  List<Object?> get props => [];
}

class ReadGuardianQuestionnaireEvent extends GuardianQuestionnaireEvent {

  const ReadGuardianQuestionnaireEvent();

  @override
  List<Object?> get props => [];
}

class CreateGuardianQuestionEvent extends GuardianQuestionnaireEvent {

  final QuestionModel questionModel;

  const CreateGuardianQuestionEvent({
    required this.questionModel,
  });

  @override
  List<Object?> get props => [
    questionModel,
  ];
}

class UpdateGuardianQuestionEvent extends GuardianQuestionnaireEvent {

  final QuestionModel questionModel;

  const UpdateGuardianQuestionEvent({
    required this.questionModel,
  });

  @override
  List<Object?> get props => [
    questionModel,
  ];
}

class DeleteGuardianQuestionEvent extends GuardianQuestionnaireEvent {

  final String id;

  const DeleteGuardianQuestionEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}


