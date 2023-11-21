import 'package:cophat/core/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../child_questionnaire/domain/use_cases/create_child_questionnaire_use_case.dart';
import '../../../child_questionnaire/domain/use_cases/delete_child_questionnaire_use_case.dart';
import '../../../child_questionnaire/domain/use_cases/read_child_questionnaire_use_case.dart';
import '../../../child_questionnaire/domain/use_cases/update_child_questionnaire_use_case.dart';
import '../../../core/entities/question_entity.dart';
import '../../../core/models/question_model.dart';

part 'child_questionnaire_event.dart';
part 'child_questionnaire_state.dart';

class ChildQuestionnaireBloc extends Bloc<ChildQuestionnaireEvent, ChildQuestionnaireState> {

  final CreateChildQuestionnaireUseCase _createChildQuestionnaireUseCase;
  final ReadChildQuestionnairesUseCase _readChildQuestionnairesUseCase;
  final UpdateChildQuestionnaireUseCase _updateChildQuestionnaireUseCase;
  final DeleteChildQuestionnaireUseCase _deleteChildQuestionnaireUseCase;

  ChildQuestionnaireBloc({
    required CreateChildQuestionnaireUseCase createChildQuestionnaireUseCase,
    required ReadChildQuestionnairesUseCase readChildQuestionnairesUseCase,
    required UpdateChildQuestionnaireUseCase updateChildQuestionnaireUseCase,
    required DeleteChildQuestionnaireUseCase deleteChildQuestionnaireUseCase,
  }) : _createChildQuestionnaireUseCase = createChildQuestionnaireUseCase,
        _readChildQuestionnairesUseCase = readChildQuestionnairesUseCase,
        _updateChildQuestionnaireUseCase = updateChildQuestionnaireUseCase,
        _deleteChildQuestionnaireUseCase = deleteChildQuestionnaireUseCase,
        super(const ChildQuestionnaireEmpty()) {
    on<CreateChildQuestionnaireEvent>(_onCreateChildQuestionnaire);
    on<ReadChildQuestionnaireEvent>(_onReadChildQuestionnaire);
    on<UpdateChildQuestionnaireEvent>(_onUpdateChildQuestionnaire);
    on<DeleteChildQuestionnaireEvent>(_onDeleteGuardianQuestion);
  }

  List<QuestionEntity>? questionsList;

  _onCreateChildQuestionnaire(
      CreateChildQuestionnaireEvent event,
      Emitter<ChildQuestionnaireState> emit,
      ) async {

    emit(const ChildQuestionnaireLoading());

    event.questionModel.position = questionsList?.length ?? 0;

    final result = await _createChildQuestionnaireUseCase(CreateChildQuestionnaireUseCaseParams(
      childQuestionnaire: event.questionModel
    ));

    result.fold(
          (failure) {
        emit(ChildQuestionnaireError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onReadChildQuestionnaire(
      ChildQuestionnaireEvent event,
      Emitter<ChildQuestionnaireState> emit,
      ) async {

    emit(const ChildQuestionnaireLoading());

    final ChildQuestionnaire = await _readChildQuestionnairesUseCase(NoParams());

    ChildQuestionnaire.fold(
          (failure) {
        emit(ChildQuestionnaireError(failure.message));
      },
          (content) async {
            questionsList = content;
            if(content.isEmpty) {
              emit(const ChildQuestionnaireEmpty());
            } else {
              emit(ChildQuestionnaireSuccess(questionsList: content));
            }
      },
    );
  }

  _onUpdateChildQuestionnaire(
      UpdateChildQuestionnaireEvent event,
      Emitter<ChildQuestionnaireState> emit,
      ) async {
    emit(const ChildQuestionnaireLoading());

    final result = await _updateChildQuestionnaireUseCase(UpdateChildQuestionnaireUseCaseParams(
      childQuestionnaire: event.questionModel
    ));

    result.fold(
          (failure) {
        emit(ChildQuestionnaireError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onDeleteGuardianQuestion(
      DeleteChildQuestionnaireEvent event,
      Emitter<ChildQuestionnaireState> emit,
      ) async {
    emit(const ChildQuestionnaireLoading());

    final result = await _deleteChildQuestionnaireUseCase(DeleteChildQuestionnaireUseCaseParams(
        id: event.id
    ));

    result.fold(
          (failure) {
        emit(ChildQuestionnaireError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

}
