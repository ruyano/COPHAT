part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}


class UserEmpty extends UserState {

  const UserEmpty();

  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {

  const UserLoading();

  @override
  List<Object?> get props => [];
}

class UserSuccess extends UserState {

  final List<UserEntity>? questionsList;

  const UserSuccess({
    this.questionsList
  });

  @override
  List<Object?> get props => [
    questionsList
  ];
}

class CreateOrUpdateOrDeleteSuccess extends UserState {

  const CreateOrUpdateOrDeleteSuccess();

  @override
  List<Object?> get props => [];
}

class UserError extends UserState {

  final String message;

  const UserError( this.message, );

  @override
  List<Object?> get props => [
    message,
  ];
}

