import 'package:flutter/material.dart';

import 'package:FlutterApp/demo/router.dart';
import 'package:FlutterApp/layout/home.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter App',
      home: new RootApp(),
    ));

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter App'),
        ),
        body: new Padding(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new DemoRouter()),
                    );
                  },
                  child: new Center(
                    child: new Text('示例项目'),
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new LayoutHomeScreen()),
                    );
                  },
                  child: new Center(
                    child: new Text('构建布局'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
