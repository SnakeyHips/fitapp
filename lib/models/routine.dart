import 'package:fitapp/models/week.dart';

class Routine {
  String name;
  String description;
  List<Week> weeks;

  Routine({this.name, this.description, this.weeks});

  factory Routine.fromJson(Map<String, dynamic> json) {
    var weeksJson = json['weeks'] as List;

    return new Routine(
        name: json['name'],
        description: json['description'],
        weeks: weeksJson.map((i) => Week.fromJson(i)).toList());
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'description': description, 'weeks': weeks};
}
