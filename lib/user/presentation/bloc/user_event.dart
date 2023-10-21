part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {

  const UserEvent();

  @override
  List<Object?> get props => [];
}

class CreateUserEvent extends UserEvent {

  final UserModel userModel;

  const CreateUserEvent({
    required this.userModel,
  });

  @override
  List<Object?> get props => [
    userModel,
  ];
}

class ReadUserEvent extends UserEvent {

  const ReadUserEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUserEvent extends UserEvent {

  final UserModel userModel;

  const UpdateUserEvent({
    required this.userModel,
  });

  @override
  List<Object?> get props => [
    userModel,
  ];
}

class DeleteUserEvent extends UserEvent {

  final String id;

  const DeleteUserEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}


