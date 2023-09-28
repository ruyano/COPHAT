part of 'child_questionnaire_bloc.dart';

abstract class ChildQuestionnaireEvent extends Equatable {

  const ChildQuestionnaireEvent();

  @override
  List<Object?> get props => [];
}

class CreateChildQuestionnaireEvent extends ChildQuestionnaireEvent {

  final ChildQuestionnaireModel questionModel;

  const CreateChildQuestionnaireEvent({
    required this.questionModel,
  });

  @override
  List<Object?> get props => [
    questionModel,
  ];
}

class ReadChildQuestionnaireEvent extends ChildQuestionnaireEvent {

  const ReadChildQuestionnaireEvent();

  @override
  List<Object?> get props => [];
}

class UpdateChildQuestionnaireEvent extends ChildQuestionnaireEvent {

  final ChildQuestionnaireModel questionModel;

  const UpdateChildQuestionnaireEvent({
    required this.questionModel,
  });

  @override
  List<Object?> get props => [
    questionModel,
  ];
}

class DeleteChildQuestionnaireEvent extends ChildQuestionnaireEvent {

  final String id;

  const DeleteChildQuestionnaireEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}


