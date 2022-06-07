class Perro {
  String id;
  String name;
  String birthday;
  String age;
  String size;
  String race;
  String desc;

  Perro({
    this.id = '',
    this.name,
    this.birthday,
    this.age,
    this.size,
    this.race,
    this.desc,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'birthday': birthday,
        'age': age,
        'size': size,
        'race': race,
        'desc': desc,
      };
}
