import 'package:fitapp/models/day.dart';
import 'package:flutter/material.dart';

class DayPage extends StatefulWidget {
  final int selectedRoutine;
  final int selectedWeek;
  final Day selectedDay;

  DayPage({this.selectedRoutine, this.selectedWeek, this.selectedDay});

  @override
  State createState() => DayPageState();
}

class DayPageState extends State<DayPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "week"+
        widget.selectedRoutine.toString() +
            widget.selectedWeek.toString(),
        child: Material(
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
                                child: Text(widget.selectedRoutine.toString(),
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)))
                          ]),
                    ],
                  ),
                ))));
  }
}
