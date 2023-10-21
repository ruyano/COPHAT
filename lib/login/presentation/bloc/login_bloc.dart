import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/do_login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final doLoginUseCase _doLoginUseCase;

  LoginBloc({
    required doLoginUseCase doLoginUseCase,
  }) : _doLoginUseCase = doLoginUseCase,
        super(const LoginInitial()) {
    on<Login>(_onLoginLogin);
  }

  _onLoginLogin(
      Login event,
      Emitter<LoginState> emit,
      ) async {
    emit(const LoginLoading());

    final userCredential = await _doLoginUseCase(DoLoginUseCaseParams(
      email: event.email,
      password: event.password,
    ));

    userCredential.fold(
          (failure) {
        emit(LoginError(failure.message));
      },
          (content) async {
            if(content.userEntity?.isAdmin ?? false) {
              emit(const AdminLoginSuccess());
            } else {
              emit(const LoginSuccess());
            }
      },
    );

  }

}
