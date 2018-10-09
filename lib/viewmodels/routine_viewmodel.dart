import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:fitapp/models/routine.dart';

class RoutineViewModel {
  static List<Routine> routines;

  static Future<String> _loadRoutinesAsset() async {
    return await rootBundle.loadString('assets/routines.json');
  }

  static Future loadRoutines() async {
    try {
      routines = new List<Routine>();
      String routinesJson = await _loadRoutinesAsset();
      List routinesParsed = json.decode(routinesJson);
      for (int i = 0; i < routinesParsed.length; i++) {
        routines.add(new Routine.fromJson(routinesParsed[i]));
      }
      print(routines[0].weeks[0].monday.description);
    } catch (e) {
      print(e);
    }
  }
}
