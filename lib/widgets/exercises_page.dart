import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/viewmodels/exercise_viewmodel.dart';
import 'package:flutter/material.dart';

class ExercisesPage extends StatefulWidget {
  @override
  State createState() => ExercisesPageState();
}

class ExercisesPageState extends State<ExercisesPage> {
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ThemeData.dark().canvasColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: TextField(
                  style: TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        controller.clear();
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                    hintText: "Search...",
                  ),
                  controller: controller,
                )),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 8.0), child: _buildExercises()),
            )
          ],
        ));
  }

  Widget _buildExercises() {
    return ListView.builder(
      itemCount: ExerciseViewModel.exercises.length,
      itemBuilder: (BuildContext context, int index) {
        if (filter == null || filter == "") {
          return _buildRow(ExerciseViewModel.exercises[index]);
        } else {
          if (ExerciseViewModel.exercises[index].name
              .toLowerCase()
              .contains(filter.toLowerCase())) {
            return _buildRow(ExerciseViewModel.exercises[index]);
          } else {
            return Container();
          }
        }
      },
    );
  }

  Widget _buildRow(Exercise e) {
    return ListTile(
        title: Text(
          e.name,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text(e.areas),
        onTap: () async {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(e.name),
                    content: Text(e.description),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ]);
              });
        });
  }
}
