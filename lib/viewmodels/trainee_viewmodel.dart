import 'dart:convert';
import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitapp/models/trainee.dart';

class TraineeViewModel {
  static Trainee trainee;

  static Future loadTrainee() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      trainee = new Trainee.fromJson(json.decode(prefs.getString('trainee')));
    } catch (e) {
      print(e);
      trainee = new Trainee(name: "Name", age: 0, height: 0.0, weight: 0.0);
    }
  }

  static Future<bool> saveTrainee() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      prefs.setString('trainee', json.encode(trainee.toJson()));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> clearTrainee() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      prefs.remove('trainee');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
