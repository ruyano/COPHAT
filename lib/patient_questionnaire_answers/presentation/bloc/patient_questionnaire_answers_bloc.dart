import 'package:cophat/core/use_case.dart';
import 'package:cophat/patient_questionnaire_answers/data/models/patient_questionnaire_answers_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../child_questionnaire/domain/entities/child_questionnaire_entity.dart';
import '../../../child_questionnaire/domain/use_cases/read_child_questionnaire_use_case.dart';
import '../../../patient_questionnaire_answers/domain/use_cases/create_patient_questionnaire_answers_use_case.dart';
import '../../../patient_questionnaire_answers/domain/use_cases/delete_patient_questionnaire_answers_use_case.dart';
import '../../../patient_questionnaire_answers/domain/use_cases/read_patient_questionnaire_answers_use_case.dart';
import '../../../patient_questionnaire_answers/domain/use_cases/update_patient_questionnaire_answers_use_case.dart';
import '../../domain/entities/patient_questionnaire_answers_entity.dart';

part 'patient_questionnaire_answers_event.dart';
part 'patient_questionnaire_answers_state.dart';

class PatientQuestionnaireAnswersBloc extends Bloc<PatientQuestionnaireAnswersEvent, PatientQuestionnaireAnswersState> {

  final CreatePatientQuestionnaireAnswersUseCase _createPatientQuestionnaireAnswersUseCase;
  final ReadPatientQuestionnaireAnswerssUseCase _readPatientQuestionnaireAnswerssUseCase;
  final UpdatePatientQuestionnaireAnswersUseCase _updatePatientQuestionnaireAnswersUseCase;
  final DeletePatientQuestionnaireAnswersUseCase _deletePatientQuestionnaireAnswersUseCase;

  final ReadChildQuestionnairesUseCase _readChildQuestionnairesUseCase;

  PatientQuestionnaireAnswersBloc({
    required CreatePatientQuestionnaireAnswersUseCase createPatientQuestionnaireAnswersUseCase,
    required ReadPatientQuestionnaireAnswerssUseCase readPatientQuestionnaireAnswerssUseCase,
    required UpdatePatientQuestionnaireAnswersUseCase updatePatientQuestionnaireAnswersUseCase,
    required DeletePatientQuestionnaireAnswersUseCase deletePatientQuestionnaireAnswersUseCase,
    required ReadChildQuestionnairesUseCase readChildQuestionnairesUseCase,
  }) : _createPatientQuestionnaireAnswersUseCase = createPatientQuestionnaireAnswersUseCase,
        _readPatientQuestionnaireAnswerssUseCase = readPatientQuestionnaireAnswerssUseCase,
        _updatePatientQuestionnaireAnswersUseCase = updatePatientQuestionnaireAnswersUseCase,
        _deletePatientQuestionnaireAnswersUseCase = deletePatientQuestionnaireAnswersUseCase,
        _readChildQuestionnairesUseCase = readChildQuestionnairesUseCase,
        super(const PatientQuestionnaireAnswersEmpty()) {
    on<CreatePatientQuestionnaireAnswersEvent>(_onCreatePatientQuestionnaireAnswers);
    on<ReadPatientQuestionnaireAnswersEvent>(_onReadPatientQuestionnaireAnswers);
    on<UpdatePatientQuestionnaireAnswersEvent>(_onUpdatePatientQuestionnaireAnswers);
    on<DeletePatientQuestionnaireAnswersEvent>(_onDeleteGuardianQuestion);
    on<ReadChildQuestionnaireEvent>(_onReadChildQuestionnaire);
  }

  _onCreatePatientQuestionnaireAnswers(
      CreatePatientQuestionnaireAnswersEvent event,
      Emitter<PatientQuestionnaireAnswersState> emit,
      ) async {

    emit(const PatientQuestionnaireAnswersLoading());

    final result = await _createPatientQuestionnaireAnswersUseCase(CreatePatientQuestionnaireAnswersUseCaseParams(
      patientQuestionnaireAnswers: event.patientQuestionnaireAnswersModel
    ));

    result.fold(
          (failure) {
        emit(PatientQuestionnaireAnswersError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onReadPatientQuestionnaireAnswers(
      PatientQuestionnaireAnswersEvent event,
      Emitter<PatientQuestionnaireAnswersState> emit,
      ) async {

    emit(const PatientQuestionnaireAnswersLoading());

    final PatientQuestionnaireAnswers = await _readPatientQuestionnaireAnswerssUseCase(NoParams());

    PatientQuestionnaireAnswers.fold(
          (failure) {
        emit(PatientQuestionnaireAnswersError(failure.message));
      },
          (content) async {
            if(content.isEmpty) {
              emit(const PatientQuestionnaireAnswersEmpty());
            } else {
              emit(PatientQuestionnaireAnswersSuccess(patientQuestionnaireAnswersList: content));
            }
      },
    );
  }

  _onUpdatePatientQuestionnaireAnswers(
      UpdatePatientQuestionnaireAnswersEvent event,
      Emitter<PatientQuestionnaireAnswersState> emit,
      ) async {
    emit(const PatientQuestionnaireAnswersLoading());

    final result = await _updatePatientQuestionnaireAnswersUseCase(UpdatePatientQuestionnaireAnswersUseCaseParams(
      patientQuestionnaireAnswers: event.patientQuestionnaireAnswersModel
    ));

    result.fold(
          (failure) {
        emit(PatientQuestionnaireAnswersError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onDeleteGuardianQuestion(
      DeletePatientQuestionnaireAnswersEvent event,
      Emitter<PatientQuestionnaireAnswersState> emit,
      ) async {
    emit(const PatientQuestionnaireAnswersLoading());

    final result = await _deletePatientQuestionnaireAnswersUseCase(DeletePatientQuestionnaireAnswersUseCaseParams(
        id: event.id
    ));

    result.fold(
          (failure) {
        emit(PatientQuestionnaireAnswersError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onReadChildQuestionnaire(
      ReadChildQuestionnaireEvent event,
      Emitter<PatientQuestionnaireAnswersState> emit,
      ) async {

    emit(const PatientQuestionnaireAnswersLoading());

    final childQuestionnaire = await _readChildQuestionnairesUseCase(NoParams());

    childQuestionnaire.fold(
          (failure) {
        emit(PatientQuestionnaireAnswersError(failure.message));
      },
          (content) async {
        emit(ChildQuestionnaireSuccess(questionsList: content));
      },
    );
  }

}
