import 'dart:convert';
import 'dart:async' show Future;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fitapp/models/exercise.dart';
import 'package:path_provider/path_provider.dart';

class ExerciseViewModel {
 static Map<String, Exercise> exercises;

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

 static Future _loadJson(String routinesJson) async {
    try {
      exercises = new Map<String, Exercise>();
      Map exercisesParsed = json.decode(routinesJson);
      for(var key in exercisesParsed.keys){
        exercises[key.toString()] = new Exercise.fromJson(exercisesParsed[key]);
      }
    } catch (e) {
      print(e);
    }
  }

    static Future saveFile() async {
    File file = await getFile();
    file.writeAsString(json.encode(exercises));
  }
}
