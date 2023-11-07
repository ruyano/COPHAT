import 'package:cophat/core/use_case.dart';
import 'package:cophat/guardian_questionnaire/domain/use_cases/create_guardian_question_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/entities/question_entity.dart';
import '../../../core/models/question_model.dart';
import '../../domain/use_cases/delete_guardian_question_use_case.dart';
import '../../domain/use_cases/read_guardian_question_use_case.dart';
import '../../domain/use_cases/update_guardian_question_use_case.dart';

part 'guardian_questionnaire_event.dart';
part 'guardian_questionnaire_state.dart';

class GuardianQuestionnaireBloc extends Bloc<GuardianQuestionnaireEvent, GuardianQuestionnaireState> {

  final CreateGuardianQuestionUseCase _createGuardianQuestionUseCase;
  final ReadGuardianQuestionsUseCase _readGuardianQuestionsUseCase;
  final UpdateGuardianQuestionUseCase _updateGuardianQuestionUseCase;
  final DeleteGuardianQuestionUseCase _deleteGuardianQuestionUseCase;

  GuardianQuestionnaireBloc({
    required CreateGuardianQuestionUseCase createGuardianQuestionUseCase,
    required ReadGuardianQuestionsUseCase readGuardianQuestionsUseCase,
    required UpdateGuardianQuestionUseCase updateGuardianQuestionUseCase,
    required DeleteGuardianQuestionUseCase deleteGuardianQuestionUseCase,
  }) : _createGuardianQuestionUseCase = createGuardianQuestionUseCase,
        _readGuardianQuestionsUseCase = readGuardianQuestionsUseCase,
        _updateGuardianQuestionUseCase = updateGuardianQuestionUseCase,
        _deleteGuardianQuestionUseCase = deleteGuardianQuestionUseCase,
        super(const GuardianQuestionnaireEmpty()) {
    on<CreateGuardianQuestionEvent>(_onCreateGuardianQuestionnaire);
    on<ReadGuardianQuestionnaireEvent>(_onReadGuardianQuestionnaire);
    on<UpdateGuardianQuestionEvent>(_onUpdateGuardianQuestionnaire);
    on<DeleteGuardianQuestionEvent>(_onDeleteGuardianQuestion);
  }

  List<QuestionEntity>? questionsList;

  _onCreateGuardianQuestionnaire(
      CreateGuardianQuestionEvent event,
      Emitter<GuardianQuestionnaireState> emit,
      ) async {

    emit(const GuardianQuestionnaireLoading());

    final result = await _createGuardianQuestionUseCase(CreateGuardianQuestionUseCaseParams(
        question: event.questionModel
    ));

    result.fold(
          (failure) {
        emit(GuardianQuestionnaireError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onReadGuardianQuestionnaire(
      GuardianQuestionnaireEvent event,
      Emitter<GuardianQuestionnaireState> emit,
      ) async {

    emit(const GuardianQuestionnaireLoading());

    final guardianQuestionnaire = await _readGuardianQuestionsUseCase(NoParams());

    guardianQuestionnaire.fold(
          (failure) {
        emit(GuardianQuestionnaireError(failure.message));
      },
          (content) async {
            questionsList = content;
            if(content.isEmpty) {
              emit(const GuardianQuestionnaireEmpty());
            } else {
              emit(GuardianQuestionnaireSuccess(questionsList: content));
            }

      },
    );
  }

  _onUpdateGuardianQuestionnaire(
      UpdateGuardianQuestionEvent event,
      Emitter<GuardianQuestionnaireState> emit,
      ) async {
    emit(const GuardianQuestionnaireLoading());

    final result = await _updateGuardianQuestionUseCase(UpdateGuardianQuestionUseCaseParams(
        question: event.questionModel
    ));

    result.fold(
          (failure) {
        emit(GuardianQuestionnaireError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onDeleteGuardianQuestion(
      DeleteGuardianQuestionEvent event,
      Emitter<GuardianQuestionnaireState> emit,
      ) async {
    emit(const GuardianQuestionnaireLoading());

    final result = await _deleteGuardianQuestionUseCase(DeleteGuardianQuestionUseCaseCaseParams(
        id: event.id
    ));

    result.fold(
          (failure) {
        emit(GuardianQuestionnaireError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

}
