part of 'patient_bloc.dart';

abstract class PatientEvent extends Equatable {

  const PatientEvent();

  @override
  List<Object?> get props => [];
}

class CreatePatientEvent extends PatientEvent {

  final PatientModel patientModel;

  const CreatePatientEvent({
    required this.patientModel,
  });

  @override
  List<Object?> get props => [
      patientModel,
  ];
}

class ReadPatientEvent extends PatientEvent {

  const ReadPatientEvent();

  @override
  List<Object?> get props => [];
}

class UpdatePatientEvent extends PatientEvent {

  final PatientModel patientModel;

  const UpdatePatientEvent({
    required this.patientModel,
  });

  @override
  List<Object?> get props => [
      patientModel,
  ];
}

class DeletePatientEvent extends PatientEvent {

  final String id;

  const DeletePatientEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}


