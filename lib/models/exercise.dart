class Exercise {
  String name;
  String description;
  String areas;
  double weight;
  int sets;
  int reps;

  Exercise(this.name, this.description, this.areas, this.weight, this.sets, this.reps);

  Exercise.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        areas = json['areas'],
        weight = json['weight'],
        sets = json['sets'],
        reps = json['reps'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'description': description, 'areas': areas, 'weight': weight, 'sets': sets, 'reps': reps};
}