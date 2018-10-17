import 'package:fitapp/models/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseDialog extends StatefulWidget {
  final Exercise selectedExercise;

  ExerciseDialog({this.selectedExercise});

  @override
  State<StatefulWidget> createState() => ExerciseDialogState();
}

class ExerciseDialogState extends State<ExerciseDialog> {
  final _formKey = GlobalKey<FormState>();

  TextFormField weightField;
  TextFormField setField;
  TextFormField repField;
  TextEditingController weightController = new TextEditingController();
  TextEditingController setController = new TextEditingController();
  TextEditingController repController = new TextEditingController();

  @override
  void initState() {
    weightController.text = widget.selectedExercise.weight.toString();
    setController.text = widget.selectedExercise.sets.toString();
    repController.text = widget.selectedExercise.reps.toString();
    weightField = new TextFormField(
      controller: weightController,
      decoration:
          InputDecoration(labelText: "Weight", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty || (double.tryParse(value) == null)) {
          return "Please enter a valid decimal!";
        }
      },
    );
    setField = new TextFormField(
      controller: setController,
      decoration:
          InputDecoration(labelText: "Sets", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty || (int.tryParse(value) == null)) {
          return "Please enter a valid number!";
        }
      },
    );
    repField = new TextFormField(
      controller: repController,
      decoration:
          InputDecoration(labelText: "Reps", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty || (int.tryParse(value) == null)) {
          return "Please enter a valid number!";
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    weightController.dispose();
    setController.dispose();
    repController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SimpleDialog(
          title: Text(widget.selectedExercise.name),
          contentPadding: EdgeInsets.all(12.0),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 16.0, left: 12.0, right: 12.0),
                child: weightField),
            Padding(
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 16.0, left: 12.0, right: 12.0),
                child: setField),
            Padding(
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 12.0, right: 12.0),
                child: repField),
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
                      if (_formKey.currentState.validate()) {
                        widget.selectedExercise.weight =
                            double.parse(weightController.text);
                        widget.selectedExercise.sets =
                            int.parse(setController.text);
                        widget.selectedExercise.reps =
                            int.parse(repController.text);
                        Navigator.of(context).pop(widget.selectedExercise);
                      }
                    }),
              ],
            )
          ],
        ));
  }
}
