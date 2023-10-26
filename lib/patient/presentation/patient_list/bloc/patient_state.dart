part of 'patient_bloc.dart';

abstract class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object?> get props => [];
}


class PatientEmpty extends PatientState {

  const PatientEmpty();

  @override
  List<Object?> get props => [];
}

class PatientLoading extends PatientState {

  const PatientLoading();

  @override
  List<Object?> get props => [];
}

class PatientSuccess extends PatientState {

  final List<PatientEntity>? patientList;

  const PatientSuccess({
    this.patientList
  });

  @override
  List<Object?> get props => [
    patientList
  ];
}

class CreateOrUpdateOrDeleteSuccess extends PatientState {

  const CreateOrUpdateOrDeleteSuccess();

  @override
  List<Object?> get props => [];
}

class PatientError extends PatientState {

  final String message;

  const PatientError( this.message, );

  @override
  List<Object?> get props => [
    message,
  ];
}

