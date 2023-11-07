part of 'patient_questionnaire_answers_bloc.dart';

abstract class PatientQuestionnaireAnswersState extends Equatable {
  const PatientQuestionnaireAnswersState();

  @override
  List<Object?> get props => [];
}


class PatientQuestionnaireAnswersEmpty extends PatientQuestionnaireAnswersState {

  const PatientQuestionnaireAnswersEmpty();

  @override
  List<Object?> get props => [];
}

class PatientQuestionnaireAnswersLoading extends PatientQuestionnaireAnswersState {

  const PatientQuestionnaireAnswersLoading();

  @override
  List<Object?> get props => [];
}

class PatientQuestionnaireAnswersSuccess extends PatientQuestionnaireAnswersState {

  final List<AnswersModel>? patientQuestionnaireAnswersList;

  const PatientQuestionnaireAnswersSuccess({
    this.patientQuestionnaireAnswersList
  });

  @override
  List<Object?> get props => [
    patientQuestionnaireAnswersList
  ];
}

class CreateOrUpdateOrDeleteSuccess extends PatientQuestionnaireAnswersState {

  const CreateOrUpdateOrDeleteSuccess();

  @override
  List<Object?> get props => [];
}

class PatientQuestionnaireAnswersError extends PatientQuestionnaireAnswersState {

  final String message;

  const PatientQuestionnaireAnswersError( this.message, );

  @override
  List<Object?> get props => [
    message,
  ];
}

class ChildQuestionnaireSuccess extends PatientQuestionnaireAnswersState {

  final List<QuestionModel>? questionsList;

  const ChildQuestionnaireSuccess({
    this.questionsList
  });

  @override
  List<Object?> get props => [
    questionsList
  ];
}

