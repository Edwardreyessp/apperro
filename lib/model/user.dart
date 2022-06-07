class MyUser {
  String id;
  String name;
  String email;
  String birthday;

  MyUser({
    this.id = '',
    this.name,
    this.email,
    this.birthday,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'birthday': birthday,
      };
}
