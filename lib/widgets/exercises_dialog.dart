import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/viewmodels/exercise_viewmodel.dart';
import 'package:flutter/material.dart';

class ExercisesDialog extends StatefulWidget {
  final List<Exercise> selectedExercises;

  ExercisesDialog({this.selectedExercises});

  @override
  State<StatefulWidget> createState() => ExercisesDialogState();
}

class ExercisesDialogState extends State<ExercisesDialog> {

  @override
  void initState() {
      for(int i = 0; i < widget.selectedExercises.length; i++){
        for(int j = 0; j < ExerciseViewModel.exercises.length; j++){
          if(widget.selectedExercises[i].name == ExerciseViewModel.exercises[j].name){
            ExerciseViewModel.exercises[j].selected = true;
            break;
          }
        }
      }
      super.initState();
  }

  @override
  void dispose() {
    for(int i = 0; i < ExerciseViewModel.exercises.length; i++){
      ExerciseViewModel.exercises[i].selected = false;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Select exercises"),
      contentPadding: EdgeInsets.all(12.0),
      children: <Widget>[
        Divider(),
        SizedBox(
            height: 250.0,
            child: ListView.builder(
              itemCount: ExerciseViewModel.exercises.length,
              itemBuilder: (context, int index) {
                return CheckboxListTile(
                  title: Text(ExerciseViewModel.exercises[index].name),
                  value: ExerciseViewModel.exercises[index].selected,
                  onChanged: (bool value) {
                    setState(() {
                      ExerciseViewModel.exercises[index].selected = value;
                      if (value) {
                        widget.selectedExercises
                            .add(ExerciseViewModel.exercises[index]);
                      } else {
                        widget.selectedExercises
                            .remove(ExerciseViewModel.exercises[index]);
                      }
                    });
                  },
                );
              },
            )),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
                child: Text("Cancel"),
                onPressed: () async {
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text(
                  "Save",
                  style: TextStyle(color: ThemeData.dark().accentColor),
                ),
                onPressed: () async {
                  Navigator.of(context).pop(widget.selectedExercises);
                }),
          ],
        )
      ],
    );
  }
}
