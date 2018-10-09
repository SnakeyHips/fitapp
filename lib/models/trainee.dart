class Trainee {
  String name;
  int age;
  double height;
  double weight;

  Trainee({this.name, this.age, this.height, this.weight});

  factory Trainee.fromJson(Map<String, dynamic> json) {
    return new Trainee(
        name: json['name'],
        age: json['age'],
        height: json['height'],
        weight: json['weight']);
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'age': age, 'height': height, 'weight': weight};
}
