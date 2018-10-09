import 'package:fitapp/widgets/exercises_page.dart';
import 'package:fitapp/widgets/progress_page.dart';
import 'package:fitapp/widgets/routines_page.dart';
import 'package:fitapp/widgets/trainee_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _menuKey = new GlobalKey();
  int _pageIndex = 0;
  final List<Widget> _pages = <Widget>[
    RoutinesPage(),
    ProgressPage(),
    ExercisesPage(),
    TraineePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        PopupMenuButton(
          key: _menuKey,
          itemBuilder: (context) => <PopupMenuItem>[
                PopupMenuItem<String>(
                    child: const Text("Settings"), value: "Settings"),
                PopupMenuItem<String>(
                    child: const Text("About"), value: "About")
              ],
          onSelected: (result) async {
            if (result == "Settings") {
              //open settings here
            } else if (result == "About") {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text("FitApp - About"),
                        content: Text(""),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ]);
                  });
            }
          },
        )
      ]),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _pageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range),
                title: Text(''),
                activeIcon: Icon(Icons.date_range,
                    color: ThemeData.dark().accentColor)),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment),
                title: Text(''),
                activeIcon: Icon(Icons.assessment,
                    color: ThemeData.dark().accentColor)),
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                title: Text(''),
                activeIcon: Icon(Icons.fitness_center,
                    color: ThemeData.dark().accentColor)),
            BottomNavigationBarItem(
                icon: Icon(Icons.face),
                title: Text(''),
                activeIcon:
                    Icon(Icons.face, color: ThemeData.dark().accentColor)),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
