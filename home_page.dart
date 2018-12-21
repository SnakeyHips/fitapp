import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade200,
        floatingActionButton: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 35),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.black,
              onPressed: () {},
            )),
        body: Stack(children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade900,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100.0))),
              child: Text('hello')),
          Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100.0))),
              child: Text('hello')),
          Container(
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.pink.shade300,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100.0))),
              child: Text('hello')),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100.0))),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2.0, color: Colors.pink.shade300)),
                        child: Icon(Icons.sentiment_satisfied),
                      ),
                    )),
                    Text('YOU',
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2.0, color: Colors.pink.shade300)),
                        child: Icon(Icons.trending_up),
                      ),
                    )),
                    Text('TRENDING',
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2.0, color: Colors.pink.shade300)),
                        child: Icon(Icons.favorite_border),
                      ),
                    )),
                    Text('HEALTH',
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38))
                  ],
                ),
              ],
            )),
          ),
        ]));
  }
}
