import 'package:flutter/material.dart';

import 'package:FlutterApp/demo/animate.dart';
import 'swiper.dart';
import 'package:FlutterApp/demo/popup.dart';
import 'accordion.dart';
import 'tabbar.dart';

class DemoRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('示例项目'),
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
                          builder: (context) => new AnimateScreen()),
                    );
                  },
                  child: new Center(
                    child: new Text('animate list'),
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SwipeScreen()),
                    );
                  },
                  child: new Center(
                    child: new Text('app bar'),
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new PopupScreen()),
                    );
                  },
                  child: new Center(
                    child: new Text('popup'),
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new AccordionScreen()),
                    );
                  },
                  child: new Center(
                    child: new Text('accordion'),
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new TabBarScreen()),
                    );
                  },
                  child: new Center(
                    child: new Text('tar bar'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
