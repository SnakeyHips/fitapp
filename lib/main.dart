import 'package:fitapp/app.dart';
import 'package:fitapp/viewmodels/exercise_viewmodel.dart';
import 'package:fitapp/viewmodels/routine_viewmodel.dart';
import 'package:fitapp/viewmodels/trainee_viewmodel.dart';
import 'package:flutter/material.dart';

void main() async {
  await TraineeViewModel.loadTrainee();
  await RoutineViewModel.loadRoutines();
  await ExerciseViewModel.loadExercises();
  runApp(FitApp());
}