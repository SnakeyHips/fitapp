import 'package:fitapp/viewmodels/trainee_viewmodel.dart';
import 'package:flutter/material.dart';

class TraineePage extends StatefulWidget {
  @override
  TraineePageState createState() {
    return TraineePageState();
  }
}

class TraineePageState extends State<TraineePage> {
  final _formKey = GlobalKey<FormState>();

  TextFormField nameField;
  TextFormField ageField;
  TextFormField heightField;
  TextFormField weightField;
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = TraineeViewModel.trainee.name;
    ageController.text = TraineeViewModel.trainee.age.toString();
    heightController.text = TraineeViewModel.trainee.height.toString();
    weightController.text = TraineeViewModel.trainee.weight.toString();
    nameField = new TextFormField(
      controller: nameController,
      decoration:
          InputDecoration(labelText: "Name", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter your name!";
        }
      },
    );
    ageField = new TextFormField(
      controller: ageController,
      decoration:
          InputDecoration(labelText: "Age", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty || (int.tryParse(value) == null)) {
          return "Please enter a valid age!";
        }
      },
    );
    heightField = new TextFormField(
      controller: heightController,
      decoration: InputDecoration(
          labelText: "Weight (kg)", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty || (double.tryParse(value) == null)) {
          return "Please enter a valid weight in kg!";
        }
      },
    );
    weightField = new TextFormField(
      controller: weightController,
      decoration: InputDecoration(
          labelText: "Height (cm)", border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty || (double.tryParse(value) == null)) {
          return "Please enter a valid height in cm!";
        }
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: nameField),
              Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: ageField),
              Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: weightField),
              Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: heightField),
              Padding(
                  padding: EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        TraineeViewModel.trainee.name = nameController.text;
                        TraineeViewModel.trainee.age =
                            int.parse(ageController.text);
                        TraineeViewModel.trainee.height =
                            double.parse(heightController.text);
                        TraineeViewModel.trainee.weight =
                            double.parse(weightController.text);
                        if (await TraineeViewModel.saveTrainee()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Info saved')));
                        } else {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Info failed to save')));
                        }
                      }
                    },
                    child: new Text('Save'),
                  )]))
            ]),
          ),
        );
  }
}
