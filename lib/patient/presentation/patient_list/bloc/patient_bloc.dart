import 'package:cophat/core/use_case.dart';
import 'package:cophat/patient/data/models/patient_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/patient_entity.dart';
import '../../../domain/use_cases/create_patient_use_case.dart';
import '../../../domain/use_cases/delete_patient_use_case.dart';
import '../../../domain/use_cases/read_patient_use_case.dart';
import '../../../domain/use_cases/update_patient_use_case.dart';


part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {

  final CreatePatientUseCase _createPatientUseCase;
  final ReadPatientsUseCase _readPatientsUseCase;
  final UpdatePatientUseCase _updatePatientUseCase;
  final DeletePatientUseCase _deletePatientUseCase;

  PatientBloc({
    required CreatePatientUseCase createPatientUseCase,
    required ReadPatientsUseCase readPatientsUseCase,
    required UpdatePatientUseCase updatePatientUseCase,
    required DeletePatientUseCase deletePatientUseCase,
  }) : _createPatientUseCase = createPatientUseCase,
        _readPatientsUseCase = readPatientsUseCase,
        _updatePatientUseCase = updatePatientUseCase,
        _deletePatientUseCase = deletePatientUseCase,
        super(const PatientEmpty()) {
    on<CreatePatientEvent>(_onCreatePatient);
    on<ReadPatientEvent>(_onReadPatient);
    on<UpdatePatientEvent>(_onUpdatePatient);
    on<DeletePatientEvent>(_onDeleteGuardianQuestion);
  }

  _onCreatePatient(
      CreatePatientEvent event,
      Emitter<PatientState> emit,
      ) async {

    emit(const PatientLoading());

    final result = await _createPatientUseCase(CreatePatientUseCaseParams(
      patient: event.patientModel
    ));

    result.fold(
          (failure) {
        emit(PatientError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onReadPatient(
      PatientEvent event,
      Emitter<PatientState> emit,
      ) async {

    emit(const PatientLoading());

    final Patient = await _readPatientsUseCase(NoParams());

    Patient.fold(
          (failure) {
        emit(PatientError(failure.message));
      },
          (content) async {
            if(content.isEmpty) {
              emit(const PatientEmpty());
            } else {
              emit(PatientSuccess(patientList: content));
            }
      },
    );
  }

  _onUpdatePatient(
      UpdatePatientEvent event,
      Emitter<PatientState> emit,
      ) async {
    emit(const PatientLoading());

    final result = await _updatePatientUseCase(UpdatePatientUseCaseParams(
      patient: event.patientModel
    ));

    result.fold(
          (failure) {
        emit(PatientError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onDeleteGuardianQuestion(
      DeletePatientEvent event,
      Emitter<PatientState> emit,
      ) async {
    emit(const PatientLoading());

    final result = await _deletePatientUseCase(DeletePatientUseCaseParams(
        id: event.id
    ));

    result.fold(
          (failure) {
        emit(PatientError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

}
