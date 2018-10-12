import 'package:fitapp/viewmodels/routine_viewmodel.dart';
import 'package:fitapp/widgets/day_page.dart';
import 'package:flutter/material.dart';

class RoutinesPage extends StatefulWidget {
  @override
  State createState() => RoutinesPageState();
}

class RoutinesPageState extends State<RoutinesPage> {
  @override
  Widget build(BuildContext context) { 
    return Material(
        child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: RoutineViewModel.routines.length,
                    itemBuilder: (BuildContext context, int routineIndex) {
                      return ExpansionTile(
                          title: Text(
                              RoutineViewModel.routines[routineIndex].name),
                          children: <Widget>[
                            ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: RoutineViewModel
                                  .routines[routineIndex].weeks.length,
                              itemBuilder:
                                  (BuildContext context, int weekIndex) {
                                return ExpansionTile(
                                  title: Text(RoutineViewModel
                                      .routines[routineIndex]
                                      .weeks[weekIndex]
                                      .name),
                                  children: <Widget>[
                                    Hero(
                                      tag: routineIndex.toString() +
                                          weekIndex.toString() +
                                          "Monday",
                                      child: Material(
                                        child: ListTile(
                                          title: Text("Monday"),
                                          onTap: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Scaffold(
                                                  appBar: AppBar(
                                                      title: Text(
                                                    RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .name +
                                                        " - Monday",
                                                  )),
                                                  body: DayPage(
                                                    selectedRoutine:
                                                        routineIndex,
                                                    selectedWeek: weekIndex,
                                                    selectedDay:
                                                        RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .monday,
                                                  ));
                                            }));
                                          },
                                        ),
                                      ),
                                    ),
                                    Hero(
                                      tag: routineIndex.toString() +
                                          weekIndex.toString() +
                                          "Tuesday",
                                      child: Material(
                                        child: ListTile(
                                          title: Text("Tuesday"),
                                          onTap: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Scaffold(
                                                  appBar: AppBar(
                                                      title: Text(
                                                    RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .name +
                                                        " - Tuesday",
                                                  )),
                                                  body: DayPage(
                                                    selectedRoutine:
                                                        routineIndex,
                                                    selectedWeek: weekIndex,
                                                    selectedDay:
                                                        RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .tuesday,
                                                  ));
                                            }));
                                          },
                                        ),
                                      ),
                                    ),
                                    Hero(
                                      tag: routineIndex.toString() +
                                          weekIndex.toString() +
                                          "Wednesday",
                                      child: Material(
                                        child: ListTile(
                                          title: Text("Wednesday"),
                                          onTap: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Scaffold(
                                                  appBar: AppBar(
                                                      title: Text(
                                                    RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .name +
                                                        " - Wednesday",
                                                  )),
                                                  body: DayPage(
                                                    selectedRoutine:
                                                        routineIndex,
                                                    selectedWeek: weekIndex,
                                                    selectedDay:
                                                        RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .wednesday,
                                                  ));
                                            }));
                                          },
                                        ),
                                      ),
                                    ),
                                    Hero(
                                      tag: routineIndex.toString() +
                                          weekIndex.toString() +
                                          "Thrusday",
                                      child: Material(
                                        child: ListTile(
                                          title: Text("Thursday"),
                                          onTap: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Scaffold(
                                                  appBar: AppBar(
                                                      title: Text(
                                                    RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .name +
                                                        " - Thursday",
                                                  )),
                                                  body: DayPage(
                                                    selectedRoutine:
                                                        routineIndex,
                                                    selectedWeek: weekIndex,
                                                    selectedDay:
                                                        RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .thursday,
                                                  ));
                                            }));
                                          },
                                        ),
                                      ),
                                    ),
                                    Hero(
                                      tag: routineIndex.toString() +
                                          weekIndex.toString() +
                                          "Friday",
                                      child: Material(
                                        child: ListTile(
                                          title: Text("Friday"),
                                          onTap: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Scaffold(
                                                  appBar: AppBar(
                                                      title: Text(
                                                    RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .name +
                                                        " - Friday",
                                                  )),
                                                  body: DayPage(
                                                    selectedRoutine:
                                                        routineIndex,
                                                    selectedWeek: weekIndex,
                                                    selectedDay:
                                                        RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .friday,
                                                  ));
                                            }));
                                          },
                                        ),
                                      ),
                                    ),
                                    Hero(
                                      tag: routineIndex.toString() +
                                          weekIndex.toString() +
                                          "Saturday",
                                      child: Material(
                                        child: ListTile(
                                          title: Text("Saturday"),
                                          onTap: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Scaffold(
                                                  appBar: AppBar(
                                                      title: Text(
                                                    RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .name +
                                                        " - Saturday",
                                                  )),
                                                  body: DayPage(
                                                    selectedRoutine:
                                                        routineIndex,
                                                    selectedWeek: weekIndex,
                                                    selectedDay:
                                                        RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .saturday,
                                                  ));
                                            }));
                                          },
                                        ),
                                      ),
                                    ),
                                    Hero(
                                      tag: routineIndex.toString() +
                                          weekIndex.toString() +
                                          "Sunday",
                                      child: Material(
                                        child: ListTile(
                                          title: Text("Sunday"),
                                          onTap: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Scaffold(
                                                  appBar: AppBar(
                                                      title: Text(
                                                    RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .name +
                                                        " - Sunday",
                                                  )),
                                                  body: DayPage(
                                                    selectedRoutine:
                                                        routineIndex,
                                                    selectedWeek: weekIndex,
                                                    selectedDay:
                                                        RoutineViewModel
                                                            .routines[
                                                                routineIndex]
                                                            .weeks[weekIndex]
                                                            .sunday,
                                                  ));
                                            }));
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            )
                          ]);
                    },
                  ))
                ]));
  }
}
