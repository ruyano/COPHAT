import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {

  UserModel({
      String? id,
      String? uid,
      String? email,
      String? password,
      bool? isAdmin,
    }) : super(
      id: id,
      uid: uid,
      email: email,
      password: password,
      isAdmin: isAdmin,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
      isAdmin: json['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['email'] = email;
    data['password'] = password;
    data['isAdmin'] = isAdmin;
    return data;
  }

}
