import 'package:fitapp/widgets/home_page.dart';
import 'package:flutter/material.dart';

class FitApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
            title: 'FitApp',
            theme: new ThemeData.dark(),
            home: HomePage(),
          );
  }
}
