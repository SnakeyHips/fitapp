import 'package:fitapp/models/routine.dart';
import 'package:fitapp/viewmodels/routine_viewmodel.dart';
import 'package:flutter/material.dart';

class RoutinesPage extends StatefulWidget {
  @override
  State createState() => RoutinesPageState();
}

class RoutinesPageState extends State<RoutinesPage> {
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
                  padding: EdgeInsets.only(top: 8.0), child: _buildRoutines()),
            )
          ],
        ));
  }

  Widget _buildRoutines() {
    return ListView.builder(
      itemCount: RoutineViewModel.routines.length,
      itemBuilder: (BuildContext context, int index) {
        if (filter == null || filter == "") {
          return _buildRow(RoutineViewModel.routines[index]);
        } else {
          if (RoutineViewModel.routines[index].name
              .toLowerCase()
              .contains(filter.toLowerCase())) {
            return _buildRow(RoutineViewModel.routines[index]);
          } else {
            return Container();
          }
        }
      },
    );
  }

  Widget _buildRow(Routine r) {
    return ListTile(
        title: Text(
          r.name,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text(r.description),
        onTap: () async {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(r.name),
                    content: Text(r.description),
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
