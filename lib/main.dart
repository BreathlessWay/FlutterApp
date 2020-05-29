import 'package:flutter/material.dart';
import 'package:css_colors/css_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:FlutterApp/demo/router.dart';
import 'package:FlutterApp/layout/home.dart';
import 'package:FlutterApp/form//index.dart';
import 'package:FlutterApp/animate/index.dart';

class Router {
  static const Demo = '/demo';
  static const Layout = '/layout';
  static const Form = '/form';
  static const Animate = '/animate';
}

void main() => runApp(MaterialApp(
      title: 'Flutter App',
      routes: <String, WidgetBuilder>{
        Router.Demo: (BuildContext context) => new DemoRouter(),
        Router.Layout: (BuildContext context) => new LayoutHomeScreen(),
        Router.Form: (BuildContext context) => new FormScreen(),
        Router.Animate: (BuildContext context) => new AnimateScreen()
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
          child: new Column(
            /// 类似 justify-content
            mainAxisAlignment: MainAxisAlignment.center,
            /// 类似 align-items
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new ListTile(
                leading: Icon(Icons.change_history),
                title: const Text('Form'),
                onTap: () {
                  Navigator.of(context).pushNamed(Router.Form);
                },
              ),
              new ListTile(
                leading: Icon(Icons.print),
                title: const Text('Animate'),
                onTap: () {
                  Navigator.of(context).pushNamed(Router.Animate);
                },
              )
            ],
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
                  color: CSSColors.brown,
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
              new Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: new RaisedButton(
                  onPressed: () {
                    launch('http://www.breathlessway.com');
                  },
                  child: new Center(
                    child: new Text('webview'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
