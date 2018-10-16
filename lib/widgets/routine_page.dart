import 'package:fitapp/models/day.dart';
import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/viewmodels/routine_viewmodel.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Padding(padding: EdgeInsets.all(16.0), child: Text(RoutineViewModel
                              .routines[widget.selected].description)),
                      Expanded(
                          child: ListView(
                        physics: ClampingScrollPhysics(),
                        children: <Widget>[
                          _dayTile(context, RoutineViewModel.routines[widget.selected].monday),
                          _dayTile(context, RoutineViewModel.routines[widget.selected].tuesday),
                          _dayTile(context, RoutineViewModel.routines[widget.selected].wednesday),
                          _dayTile(context, RoutineViewModel.routines[widget.selected].thursday),
                          _dayTile(context, RoutineViewModel.routines[widget.selected].friday),
                          _dayTile(context, RoutineViewModel.routines[widget.selected].saturday),
                          _dayTile(context, RoutineViewModel.routines[widget.selected].sunday),
                        ],
                      )),
                    ],
                  );
  }

  Column _dayTile(BuildContext context, Day d){
    return Column(
      children: <Widget>[
        ListTile(title: Text(d.name), trailing: IconButton(icon: Icon(Icons.edit), onPressed: () async {

        },),),
        Padding(padding: EdgeInsets.only(bottom: 8.0), child: Text(d.description, style: TextStyle(fontSize: 12.0),)),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: d.exercises.length,
          itemBuilder: (context, int index) {
            return _exerciseTile(context, d.exercises[index]);
          }
        )
      ],
    );
  }

  ListTile _exerciseTile(BuildContext context, Exercise e) {
    return ListTile(
      title: Text(e.name),
      subtitle: Text(e.weight.toString() + "kg - " + e.sets.toString() + "x" + e.reps.toString()),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        tooltip: "Edit exercise",
        onPressed: () async {},
      ));
  }
}
