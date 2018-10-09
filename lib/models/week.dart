import 'package:fitapp/models/day.dart';

class Week {
  Day monday;
  Day tuesday;
  Day wednesday;
  Day thursday;
  Day friday;
  Day saturday;
  Day sunday;

  Week(
      {this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday});

  factory Week.fromJson(Map<String, dynamic> json) {
    return new Week(
        monday: Day.fromJson(json['monday']),
        tuesday: Day.fromJson(json['tuesday']),
        wednesday: Day.fromJson(json['wednesday']),
        thursday: Day.fromJson(json['thursday']),
        friday: Day.fromJson(json['friday']),
        saturday: Day.fromJson(json['saturday']),
        sunday: Day.fromJson(json['sunday']));
  }

  Map<String, dynamic> toJson() => {
        'monday': monday.toJson(),
        'tuesday': tuesday.toJson(),
        'wednesday': wednesday.toJson(),
        'thursday': thursday.toJson(),
        'friday': friday.toJson(),
        'saturday': saturday.toJson(),
        'sunday': sunday.toJson()
      };
}
