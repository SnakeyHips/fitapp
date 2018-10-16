import 'package:fitapp/viewmodels/exercise_viewmodel.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final int selected;

  ExercisePage({this.selected});

  @override
  State createState() => ExercisePageState();
}

class ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: ExerciseViewModel.exercises[widget.selected].name,
        child: Material(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                    ExerciseViewModel
                                        .exercises[widget.selected].name,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)))
                          ]),
                      Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            color: Colors.blue,
                            height: 300.0,
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(ExerciseViewModel
                                    .exercises[widget.selected].description))
                          ])
                    ],
                  ),
                ))));
  }
}
