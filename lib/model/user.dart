class MyUser {
  String id;
  String name;
  String typeUser;
  String email;
  String birthday;

  MyUser({
    this.id = '',
    this.name,
    this.typeUser,
    this.email,
    this.birthday,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'typeUser': typeUser,
        'email': email,
        'birthday': birthday,
      };
}
