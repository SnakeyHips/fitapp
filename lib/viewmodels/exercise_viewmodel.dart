import 'dart:convert';
import 'dart:async' show Future;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fitapp/models/exercise.dart';
import 'package:path_provider/path_provider.dart';

class ExerciseViewModel {
 static List<Exercise> exercises;

  static Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/exercises.json');
  }

  static Future<File> getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/exercises.json');
  }

  static Future load() async {
    try {
      File file = await getFile();
      String exercisesFile = await file.readAsString();
      if (exercisesFile != null) {
        _loadJson(exercisesFile);
      } else {
        _loadJson(await _loadAsset());
        await saveFile();
      }
    } catch (e) {
      print(e);
      _loadJson(await _loadAsset());
      await saveFile();
    }
  }

 static Future _loadJson(String exercisesJson) async {
    try {
      exercises = new List<Exercise>();
      List exercisesParsed = json.decode(exercisesJson);
      for (int i = 0; i < exercisesParsed.length; i++) {
        exercises.add(new Exercise.fromJson(exercisesParsed[i]));
      }
    } catch (e) {
      print(e);
    }
  }

  static Future saveFile() async {
    File file = await getFile();
    file.writeAsString(json.encode(exercises));
  }

    static bool checkName(String name) {
    bool match = false;
    for(int i = 0; i < exercises.length; i++){
      if (exercises[i].name == name){
        match = true;
        break;
      }
    }
    return match;
  }
}
