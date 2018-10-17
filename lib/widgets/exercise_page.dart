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
    return Scaffold(
            appBar: AppBar(
                title: Text(ExerciseViewModel.exercises[widget.selected].name),
            actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            // Routine temp = await showDialog(
                            //     context: context,
                            //     barrierDismissible: false,
                            //     builder: (context) => RoutineDialog(
                            //         selectedRoutine:
                            //             RoutineViewModel.routines[widget.selected]));
                            // setState(() {
                            //   if (temp != null) {
                            //     RoutineViewModel.routines[widget.selected] = temp;
                            //   }
                            // });
                          }),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                               title: Text("Delete exercise"),
                                content: Text("Are you sure you wish to delete the '" + ExerciseViewModel.exercises[widget.selected].name + "' exercise?"),
                                actions: <Widget>[
                                  FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                  }),
                                  FlatButton(
                                  child: Text("Delete"),
                                  onPressed: () async {
                                    ExerciseViewModel.exercises.remove(ExerciseViewModel.exercises[widget.selected]);
                                    await ExerciseViewModel.saveFile();
                                    //also go through each routine to remove exercise
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  }),
                                ],
                            )
                          );
                        },
                      )
                    ]),
            body: Material(
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
                                        .exercises[widget.selected]
                                        .description))
                              ])
                        ],
                      ),
                    ))));
  }
}
