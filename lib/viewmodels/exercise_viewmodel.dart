import 'dart:async' show Future;
import 'package:fitapp/models/exercise.dart';

class ExerciseViewModel {
 static Map<String, Exercise> exercises;

 static Future loadExercises() async {
    exercises = {
      "BP": new Exercise("Bench Press", "do it", "chest,shoulders,triceps", 0.0, 0 , 0),
      "BS": new Exercise("Barbell Squat", "do it", "quadriceps,glutes,hamstrings", 0.0, 0 , 0),
      "OHP": new Exercise("Overhead Press", "do it", "shoulders,chest", 0.0, 0 , 0),
      "CD": new Exercise("Conventional Deadlift", "do it", "hamstrings,traps", 0.0, 0 , 0),
      "BC": new Exercise("Bicep Curl", "do it", "biceps", 0.0, 0 , 0),
      "DL":new Exercise("Dumbbell Lunges", "do it", "quadriceps,glutes,hamstrings,calves", 0.0, 0 , 0),
    };
  }
}