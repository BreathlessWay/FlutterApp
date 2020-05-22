import 'package:flutter/material.dart';

import 'header.dart';
import 'button.dart';

class LayoutHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Layout'),
      ),
      body: new Column(
        children: <Widget>[
          new LayoutHeader(),
          new LayoutButton()
        ],
      ),
    );
  }
}
