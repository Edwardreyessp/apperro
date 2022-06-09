class Actividad {
  String dogName;
  String time;
  String activity;

  Actividad({
    this.dogName,
    this.time,
    this.activity,
  });

  Map<String, dynamic> toJson() => {
        'dogname': dogName,
        'time': time,
        'activity': activity,
      };
}
