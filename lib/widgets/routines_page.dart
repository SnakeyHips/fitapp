import 'package:fitapp/viewmodels/routine_viewmodel.dart';
import 'package:fitapp/widgets/routine_page.dart';
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
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
          return _buildRow(context, index);
        } else {
          if (RoutineViewModel.routines[index].name
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
    final bool alreadySaved = RoutineViewModel.favourites
        .contains(RoutineViewModel.routines[index].name);

    return ListTile(
        title: Text(
          RoutineViewModel.routines[index].name,
          style: TextStyle(fontSize: 18.0),
        ),
        trailing: IconButton(
          icon:
              alreadySaved ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: alreadySaved ? Colors.red : null,
          onPressed: () async {
            setState(() {
              if (alreadySaved) {
                RoutineViewModel.favourites
                    .remove(RoutineViewModel.routines[index].name);
              } else {
                RoutineViewModel.favourites
                    .add(RoutineViewModel.routines[index].name);
              }
            }
            );
            await RoutineViewModel.saveFavourites();
          },
        ),
        onTap: () async {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                    title: Text(RoutineViewModel.routines[index].name),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          //switch(_pageIndex){}
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          //switch(_pageIndex){}
                        },
                      )
                    ]),
                body: RoutinePage(selected: index),
              );
            }));
          });
        });
  }
}
