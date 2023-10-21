import 'package:cophat/user/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEntity extends Equatable {

  UserCredential? user;
  UserEntity? userEntity;

  LoginEntity({
    this.user,
    this.userEntity,
  });

  @override
  List<Object?> get props => [
    user,
    userEntity,
  ];
}
