import 'package:flutter/material.dart';

import 'package:FlutterApp/demo/router.dart';
import 'package:FlutterApp/layout/home.dart';
import 'package:FlutterApp/form//index.dart';

class Router {
  static const Demo = '/demo';
  static const Layout = '/layout';
  static const Form = '/form';
}

void main() => runApp(MaterialApp(
      title: 'Flutter App',
      routes: <String, WidgetBuilder>{
        Router.Demo: (BuildContext context) => new DemoRouter(),
        Router.Layout: (BuildContext context) => new LayoutHomeScreen(),
        Router.Form: (BuildContext context) => new FormScreen()
      },
      home: new RootApp(),
    ));

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter App'),
        ),
        drawer: new Drawer(
          child: new Center(
            child: new ListTile(
              leading: Icon(Icons.change_history),
              title: const Text('Form'),
              onTap: () {
                Navigator.of(context).pushNamed(Router.Form);
              },
            ),
          ),
          elevation: 20.0,
        ),
        body: new Padding(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Router.Demo);
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
                    Navigator.pushNamed(context, Router.Layout);
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
