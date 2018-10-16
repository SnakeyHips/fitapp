import 'package:fitapp/models/exercise.dart';

class Day {
  String name;
  String description;
  List<Exercise> exercises;

  Day({this.name, this.description, this.exercises});

  factory Day.fromJson(Map<String, dynamic> json) {
    var exercisesJson = json['exercises'] as List;

    return new Day(
      name: json['name'],
      description: json['description'],
      exercises: exercisesJson.map((i) => Exercise.fromJson(i)).toList()
    );
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'description': description, 'exercises': exercises};
}
