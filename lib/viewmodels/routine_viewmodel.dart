import 'dart:convert';
import 'dart:async' show Future;
import 'dart:io';
import 'package:fitapp/models/day.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fitapp/models/routine.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoutineViewModel {
  static List<Routine> routines;
  static List<String> favourites;

  static Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/routines.json');
  }

  static Future _loadFavourites() async {
    favourites = new List<String>();
    final prefs = await SharedPreferences.getInstance();
    try {
      List temp = json.decode(prefs.getString('favourites'));
      favourites = temp.map((i) => i.toString()).toList();
    } catch (e) {
      print(e);
      favourites = new List<String>();
    }
  }

  static Future<bool> saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      prefs.setString('favourites', json.encode(favourites));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/routines.json');
  }

  static Future load() async {
    try {
      File file = await getFile();
      String routinesFile = await file.readAsString();
      if (routinesFile != null) {
        _loadJson(routinesFile);
      } else {
        _loadJson(await _loadAsset());
        await saveFile();
      }
    } catch (e) {
      print(e);
      _loadJson(await _loadAsset());
      await saveFile();
    } 
    finally {
      await _loadFavourites();
    }
  }

  static Future _loadJson(String routinesJson) async {
    try {
      routines = new List<Routine>();
      List routinesParsed = json.decode(routinesJson);
      for (int i = 0; i < routinesParsed.length; i++) {
        routines.add(new Routine.fromJson(routinesParsed[i]));
      }
    } catch (e) {
      print(e);
    }
  }

  static Future saveFile() async {
    File file = await getFile();
    file.writeAsString(json.encode(routines));
  }
}
