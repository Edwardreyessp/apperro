import 'package:apperro/model/actividad.dart';

class MyUser {
  String id;
  String name;
  String typeUser;
  String email;
  String birthday;
  List activities;

  MyUser({
    this.id = '',
    this.name,
    this.typeUser,
    this.email,
    this.birthday,
    this.activities,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'typeUser': typeUser,
        'email': email,
        'birthday': birthday,
        'activities': activities,
      };

  static MyUser fromJson(Map<String, dynamic> json) => MyUser(
        id: json['id'],
        name: json['name'],
        typeUser: json['typeUser'],
        email: json['email'],
        birthday: json['birthday'],
        activities: json['activities'],
      );
}
