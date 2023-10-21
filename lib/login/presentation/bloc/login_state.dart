part of 'login_bloc.dart';

abstract class LoginState extends Equatable {

  const LoginState();

  @override
  List<Object?> get props => [];
}


class LoginInitial extends LoginState {

  const LoginInitial();

  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {

  const LoginLoading();

  @override
  List<Object?> get props => [];
}

class AdminLoginSuccess extends LoginState {

  const AdminLoginSuccess();

  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {

  const LoginSuccess();

  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {

  final String message;

  const LoginError( this.message, );

  @override
  List<Object?> get props => [ message, ];
}

