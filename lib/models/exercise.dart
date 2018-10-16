class Exercise {
  String name;
  String description;
  String areas;
  double weight;
  int sets;
  int reps;
  bool selected = false;

  Exercise({this.name, this.description, this.areas, this.weight = 0.0, this.sets = 0, this.reps = 0});

  factory Exercise.fromJson(Map<String, dynamic> json){
    return new Exercise(
      name: json['name'],
        description: json['description'],
        areas: json['areas'],
        weight: json['weight'],
        sets: json['sets'],
        reps: json['reps']
    );
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'description': description, 'areas': areas, 'weight': weight, 'sets': sets, 'reps': reps};
}
