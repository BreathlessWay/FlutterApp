import 'package:flutter/material.dart';

import 'banner.dart';
import 'header.dart';
import 'button.dart';
import 'content.dart';

class LayoutHomeScreen extends StatelessWidget {
  final title;

  LayoutHomeScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('标题$title'),
      ),
      body: new ListView(
        children: <Widget>[
          new LayoutBanner(),
          new LayoutHeader(),
          new LayoutButton(),
          new LayoutContent()
        ],
      ),
    );
  }
}
