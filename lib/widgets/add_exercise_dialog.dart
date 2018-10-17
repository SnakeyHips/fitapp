import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/viewmodels/exercise_viewmodel.dart';
import 'package:flutter/material.dart';

class AddExerciseDialog extends StatefulWidget {
  @override
  AddExerciseDialogState createState() => new AddExerciseDialogState();
}

class AddExerciseDialogState extends State<AddExerciseDialog> {
  final _formKey = GlobalKey<FormState>();

  Exercise e =
      new Exercise(name: "name", description: "description", areas: "areas");

  TextFormField nameField;
  TextFormField descriptionField;
  TextFormField areasField;
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController areasController = new TextEditingController();

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
    areasField = new TextFormField(
      controller: areasController,
      decoration:
          InputDecoration(labelText: "Areas", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter at least one area!";
        }
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    areasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New exercise'),
          actions: [
            FlatButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    if (!ExerciseViewModel.checkName(e.name)) {
                      e.name = nameController.text;
                      e.description = descriptionController.text;
                      e.areas = areasController.text;
                      ExerciseViewModel.exercises.add(e);
                      await ExerciseViewModel.saveFile();
                      Navigator.of(context).pop();
                    } else {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => AlertDialog(
                                  title: Text("Error"),
                                  content: Text(
                                      "That name is already in use for another exercise. Please provide another."),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        })
                                  ]));
                    }
                  }
                },
                child: Text('SAVE',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.white))),
          ],
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0),
                    child: nameField),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0),
                    child: descriptionField),
                Padding(padding: const EdgeInsets.all(16.0), child: areasField),
              ],
            )));
  }
}
