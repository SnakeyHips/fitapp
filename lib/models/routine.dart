import 'package:fitapp/models/day.dart';

class Routine {
  String name;
  String description;
  Day monday;
  Day tuesday;
  Day wednesday;
  Day thursday;
  Day friday;
  Day saturday;
  Day sunday;
  Routine(
      {this.name,
      this.description,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday});

  factory Routine.fromJson(Map<String, dynamic> json) {
    return new Routine(
        name: json['name'],
        description: json['description'],
        monday: Day.fromJson(json['monday']),
        tuesday: Day.fromJson(json['tuesday']),
        wednesday: Day.fromJson(json['wednesday']),
        thursday: Day.fromJson(json['thursday']),
        friday: Day.fromJson(json['friday']),
        saturday: Day.fromJson(json['saturday']),
        sunday: Day.fromJson(json['sunday']));
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'monday': monday.toJson(),
        'tuesday': tuesday.toJson(),
        'wednesday': wednesday.toJson(),
        'thursday': thursday.toJson(),
        'friday': friday.toJson(),
        'saturday': saturday.toJson(),
        'sunday': sunday.toJson()
      };
}
