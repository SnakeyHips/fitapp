import 'package:fitapp/models/day.dart';
import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/models/routine.dart';
import 'package:fitapp/viewmodels/routine_viewmodel.dart';
import 'package:fitapp/widgets/exercise_dialog.dart';
import 'package:fitapp/widgets/routine_dialog.dart';
import 'package:flutter/material.dart';

class RoutinePage extends StatefulWidget {
  final int selected;

  RoutinePage({this.selected});

  @override
  State createState() => RoutinePageState();
}

class RoutinePageState extends State<RoutinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
                    title: Text(RoutineViewModel.routines[widget.selected].name),
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            Routine temp = await showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => RoutineDialog(
                                    selectedRoutine:
                                        RoutineViewModel.routines[widget.selected]));
                            setState(() {
                              if (temp != null) {
                                RoutineViewModel.routines[widget.selected] = temp;
                              }
                            });
                          }),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                               title: Text("Delete routine"),
                                content: Text("Are you sure you wish to delete the '" + RoutineViewModel.routines[widget.selected].name + "' routine?"),
                                actions: <Widget>[
                                  FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                  }),
                                  FlatButton(
                                  child: Text("Delete"),
                                  onPressed: () async {
                                    RoutineViewModel.routines.remove(RoutineViewModel.routines[widget.selected]);
                                    await RoutineViewModel.saveFile();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  }),
                                ],
                            )
                          );
                        },
                      )
                    ]),
                body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(16.0),
            child:
                Text(RoutineViewModel.routines[widget.selected].description)),
        Expanded(
            child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            _dayTile(
                context, RoutineViewModel.routines[widget.selected].monday),
            _dayTile(
                context, RoutineViewModel.routines[widget.selected].tuesday),
            _dayTile(
                context, RoutineViewModel.routines[widget.selected].wednesday),
            _dayTile(
                context, RoutineViewModel.routines[widget.selected].thursday),
            _dayTile(
                context, RoutineViewModel.routines[widget.selected].friday),
            _dayTile(
                context, RoutineViewModel.routines[widget.selected].saturday),
            _dayTile(
                context, RoutineViewModel.routines[widget.selected].sunday),
          ],
        )),
      ],
    ));
  }

  Widget _dayTile(BuildContext context, Day d) {
    return ExpansionTile(
      title: Text(d.name),
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              d.description,
              style: TextStyle(fontSize: 12.0),
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: d.exercises.length,
            itemBuilder: (context, int index) {
              return _exerciseTile(context, d.exercises[index]);
            })
      ],
    );
  }

  ListTile _exerciseTile(BuildContext context, Exercise e) {
    return ListTile(
        title: Text(e.name),
        subtitle: Text(e.weight.toString() +
            "kg - " +
            e.sets.toString() +
            "x" +
            e.reps.toString()),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () async {
            Exercise temp = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => ExerciseDialog(selectedExercise: e));
              setState(() {
                if(temp != null){
                  e = temp;
                }
              });
          },
        ));
  }
}
