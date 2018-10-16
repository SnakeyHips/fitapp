import 'package:fitapp/models/day.dart';
import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/models/routine.dart';
import 'package:fitapp/viewmodels/routine_viewmodel.dart';
import 'package:fitapp/widgets/exercise_dialog.dart';
import 'package:flutter/material.dart';

class AddRoutineDialog extends StatefulWidget {
  @override
  AddRoutineDialogState createState() => new AddRoutineDialogState();
}

class AddRoutineDialogState extends State<AddRoutineDialog> {

  Routine r = new Routine(
    name: "name",
    description: "description",
    monday: new Day(
        name: "Monday",
        description: "day description",
        exercises: new List<Exercise>()),
    tuesday: new Day(
        name: "Tuesday",
        description: "day description",
        exercises: new List<Exercise>()),
    wednesday: new Day(
        name: "Wednesday",
        description: "day description",
        exercises: new List<Exercise>()),
    thursday: new Day(
        name: "Thursday",
        description: "day description",
        exercises: new List<Exercise>()),
    friday: new Day(
        name: "Friday",
        description: "day description",
        exercises: new List<Exercise>()),
    saturday: new Day(
        name: "Saturday",
        description: "day description",
        exercises: new List<Exercise>()),
    sunday: new Day(
        name: "Sunday",
        description: "day description",
        exercises: new List<Exercise>()),
  );

  TextFormField nameField;
  TextFormField descriptionField;
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextFormField mondayDescriptionField;
  TextEditingController mondayDescriptionController =
      new TextEditingController();
  TextFormField tuesdayDescriptionField;
  TextEditingController tuesdayDescriptionController =
      new TextEditingController();
  TextFormField wednesdayDescriptionField;
  TextEditingController wednesdayDescriptionController =
      new TextEditingController();
  TextFormField thursdayDescriptionField;
  TextEditingController thursdayDescriptionController =
      new TextEditingController();
  TextFormField fridayDescriptionField;
  TextEditingController fridayDescriptionController =
      new TextEditingController();
  TextFormField saturdayDescriptionField;
  TextEditingController saturdayDescriptionController =
      new TextEditingController();
  TextFormField sundayDescriptionField;
  TextEditingController sundayDescriptionController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
    nameField = new TextFormField(
      controller: nameController,
      decoration:
          InputDecoration(labelText: "Name", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a name!";
        }
      },
    );
    descriptionField = new TextFormField(
      controller: descriptionController,
      decoration: InputDecoration(
          labelText: "Description", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a description!";
        }
      },
    );
    mondayDescriptionField = new TextFormField(
      controller: mondayDescriptionController,
      decoration: InputDecoration(
          labelText: "Monday Description", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a description!";
        }
      },
    );
    tuesdayDescriptionField = new TextFormField(
      controller: tuesdayDescriptionController,
      decoration: InputDecoration(
          labelText: "Tuesday Description", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a description!";
        }
      },
    );
    wednesdayDescriptionField = new TextFormField(
      controller: wednesdayDescriptionController,
      decoration: InputDecoration(
          labelText: "Wednesday Description", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a description!";
        }
      },
    );
    thursdayDescriptionField = new TextFormField(
      controller: thursdayDescriptionController,
      decoration: InputDecoration(
          labelText: "Thursday Description", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a description!";
        }
      },
    );
    fridayDescriptionField = new TextFormField(
      controller: fridayDescriptionController,
      decoration: InputDecoration(
          labelText: "Friday Description", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a description!";
        }
      },
    );
    saturdayDescriptionField = new TextFormField(
      controller: mondayDescriptionController,
      decoration: InputDecoration(
          labelText: "Saturday Description", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a description!";
        }
      },
    );
    sundayDescriptionField = new TextFormField(
      controller: mondayDescriptionController,
      decoration: InputDecoration(
          labelText: "Sunday Description", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a description!";
        }
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    mondayDescriptionController.dispose();
    tuesdayDescriptionController.dispose();
    wednesdayDescriptionController.dispose();
    thursdayDescriptionController.dispose();
    fridayDescriptionController.dispose();
    saturdayDescriptionController.dispose();
    sundayDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New routine'),
          actions: [
            FlatButton(
                onPressed: () async {
                  r.name = nameController.text;
                  r.description = descriptionController.text;
                  r.monday.description = mondayDescriptionController.text;
                  r.tuesday.description = tuesdayDescriptionController.text;
                  r.wednesday.description = wednesdayDescriptionController.text;
                  r.thursday.description = thursdayDescriptionController.text;
                  r.friday.description = fridayDescriptionController.text;
                  r.saturday.description = saturdayDescriptionController.text;
                  r.sunday.description = sundayDescriptionController.text;
                  RoutineViewModel.routines.add(r);
                  await RoutineViewModel.saveFile();
                  Navigator.of(context).pop();
                },
                child: Text('SAVE',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.white))),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0), child: nameField),
            Padding(padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0), child: descriptionField),
            _dayTile(context, r.monday, mondayDescriptionField),
            _dayTile(context, r.tuesday, tuesdayDescriptionField),
            _dayTile(context, r.wednesday, wednesdayDescriptionField),
            _dayTile(context, r.thursday, thursdayDescriptionField),
            _dayTile(context, r.friday, fridayDescriptionField),
            _dayTile(context, r.saturday, saturdayDescriptionField),
            _dayTile(context, r.sunday, sundayDescriptionField),
          ],
        )));
  }

  ExpansionTile _dayTile(
      BuildContext context, Day d, TextFormField description) {
    return ExpansionTile(
      title: Text(d.name),
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 16.0, right: 16.0), child: description),
        ListTile(
          title: Text("Exercises"),
          subtitle: Text(d.exercises.length.toString()),
          trailing: IconButton(
            icon: Icon(Icons.fitness_center),
            onPressed: () async {
              List<Exercise> temp = await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => ExerciseDialog(selectedExercises: d.exercises));
              setState(() {
                if(temp != null){
                  d.exercises = temp;
                }
              });
            },
          ),
        )
      ],
    );
  }
}
