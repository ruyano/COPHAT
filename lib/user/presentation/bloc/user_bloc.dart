import 'package:cophat/core/use_case.dart';
import 'package:cophat/user/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../login/domain/use_cases/auth_create_user_use_case.dart';
import '../../../user/domain/use_cases/create_user_use_case.dart';
import '../../../user/domain/use_cases/delete_user_use_case.dart';
import '../../../user/domain/use_cases/read_user_use_case.dart';
import '../../../user/domain/use_cases/update_user_use_case.dart';
import '../../domain/entities/user_entity.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final CreateUserUseCase _createUserUseCase;
  final ReadUsersUseCase _readUsersUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final DeleteUserUseCase _deleteUserUseCase;

  UserBloc({
    required CreateUserUseCase createUserUseCase,
    required ReadUsersUseCase readUsersUseCase,
    required UpdateUserUseCase updateUserUseCase,
    required DeleteUserUseCase deleteUserUseCase,
  }) : _createUserUseCase = createUserUseCase,
        _readUsersUseCase = readUsersUseCase,
        _updateUserUseCase = updateUserUseCase,
        _deleteUserUseCase = deleteUserUseCase,
        super(const UserEmpty()) {
    on<CreateUserEvent>(_onCreateUser);
    on<ReadUserEvent>(_onReadUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<DeleteUserEvent>(_onDeleteGuardianQuestion);
  }

  _onCreateUser(
      CreateUserEvent event,
      Emitter<UserState> emit,
      ) async {

    emit(const UserLoading());

    final result = await _createUserUseCase(CreateUserUseCaseParams(
        user: event.userModel
    ));

    result.fold(
          (failure) {
        emit(UserError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }


  _onReadUser(
      UserEvent event,
      Emitter<UserState> emit,
      ) async {

    emit(const UserLoading());

    final User = await _readUsersUseCase(NoParams());

    User.fold(
          (failure) {
        emit(UserError(failure.message));
      },
          (content) async {
            if(content.isEmpty) {
              emit(const UserEmpty());
            } else {
              emit(UserSuccess(questionsList: content));
            }
      },
    );
  }

  _onUpdateUser(
      UpdateUserEvent event,
      Emitter<UserState> emit,
      ) async {
    emit(const UserLoading());

    final result = await _updateUserUseCase(UpdateUserUseCaseParams(
        user: event.userModel
    ));

    result.fold(
          (failure) {
        emit(UserError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

  _onDeleteGuardianQuestion(
      DeleteUserEvent event,
      Emitter<UserState> emit,
      ) async {
    emit(const UserLoading());

    final result = await _deleteUserUseCase(DeleteUserUseCaseParams(
        id: event.id
    ));

    result.fold(
          (failure) {
        emit(UserError(failure.message));
      },
          (content) async {
        emit(const CreateOrUpdateOrDeleteSuccess());
      },
    );
  }

}
