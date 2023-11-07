part of 'patient_questionnaire_answers_bloc.dart';

abstract class PatientQuestionnaireAnswersEvent extends Equatable {

  const PatientQuestionnaireAnswersEvent();

  @override
  List<Object?> get props => [];
}

class CreatePatientQuestionnaireAnswersEvent extends PatientQuestionnaireAnswersEvent {

  final AnswersModel patientQuestionnaireAnswersModel;

  const CreatePatientQuestionnaireAnswersEvent({
    required this.patientQuestionnaireAnswersModel,
  });

  @override
  List<Object?> get props => [
      patientQuestionnaireAnswersModel,
  ];
}

class ReadPatientQuestionnaireAnswersEvent extends PatientQuestionnaireAnswersEvent {

  const ReadPatientQuestionnaireAnswersEvent();

  @override
  List<Object?> get props => [];
}

class UpdatePatientQuestionnaireAnswersEvent extends PatientQuestionnaireAnswersEvent {

  final AnswersModel patientQuestionnaireAnswersModel;

  const UpdatePatientQuestionnaireAnswersEvent({
    required this.patientQuestionnaireAnswersModel,
  });

  @override
  List<Object?> get props => [
      patientQuestionnaireAnswersModel,
  ];
}

class DeletePatientQuestionnaireAnswersEvent extends PatientQuestionnaireAnswersEvent {

  final String id;

  const DeletePatientQuestionnaireAnswersEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}

class ReadChildQuestionnaireEvent extends PatientQuestionnaireAnswersEvent {

  const ReadChildQuestionnaireEvent();

  @override
  List<Object?> get props => [];
}


