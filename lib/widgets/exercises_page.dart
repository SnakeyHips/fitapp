
import 'package:fitapp/viewmodels/exercise_viewmodel.dart';
import 'package:fitapp/widgets/exercise_page.dart';
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
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
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
          return _buildRow(context, index);
        } else {
          if (ExerciseViewModel.exercises[index].name
              .toLowerCase()
              .contains(filter.toLowerCase())) {
            return _buildRow(context, index);
          } else {
            return Container();
          }
        }
      },
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    return Hero(
        tag: ExerciseViewModel.exercises[index].name,
        child: Material(
            child: ListTile(
                title: Text(
                  ExerciseViewModel.exercises[index].name,
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () async {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Scaffold(
                          appBar: AppBar(
                              title:
                                  Text(ExerciseViewModel.exercises[index].name)),
                          body: ExercisePage(
                              selected: index));
                    }));
                  });
                })));
  }
}
