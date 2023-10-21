import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {

  String? id;
  String? uid;
  final String? email;
  final String? password;
  final bool? isAdmin;

  UserEntity({
    this.id,
    this.uid,
    this.email,
    this.password,
    this.isAdmin,
  });
  
  @override
  List<Object?> get props => [
    id,
    uid,
    email,
    password,
    isAdmin,
  ];
}
