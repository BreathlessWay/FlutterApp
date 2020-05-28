import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() => new FormScreenState();
}

class FormScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('表单'),
      ),
      body: new Column(),
    );
  }
}
