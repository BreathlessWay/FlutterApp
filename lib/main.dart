import 'dart:async';

import 'package:flutter/material.dart';
import 'package:css_colors/css_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:FlutterApp/demo/router.dart';
import 'package:FlutterApp/layout/home.dart';
import 'package:FlutterApp/form//index.dart';
import 'package:FlutterApp/animate/index.dart';
import 'package:FlutterApp/count/index.dart';

class Router {
  static const Demo = '/demo';
  static const Layout = '/layout';
  static const Form = '/form';
  static const Animate = '/animate';
  static const Count = '/count';
}

void collectLog(String line) {
  /// 上报log
}
void reportErrorAndLog(FlutterErrorDetails details) {
  /// 上报错误日志
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  return new FlutterErrorDetails(stack: stack);
}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };
  runZoned(
    () => runApp(MaterialApp(
      title: 'Flutter App',
      routes: <String, WidgetBuilder>{
        Router.Demo: (BuildContext context) => new DemoRouter(),
        Router.Layout: (BuildContext context) => new LayoutHomeScreen(
            title: ModalRoute.of(context).settings.arguments),
        Router.Animate: (BuildContext context) => new AnimateScreen(),
      },

      /// 路由钩子
      /// 只有未在routes路由表中声明的路由才会经过路由钩子
      /// 只会对命名路由pushNamed生效
      onGenerateRoute: (RouteSettings settings) {
        return new MaterialPageRoute(builder: (BuildContext context) {
          String routeName = settings.name;
          print(routeName);
          if (routeName == Router.Form) {
            return new FormScreen();
          }
          return null;
        });
      },
      home: new RootApp(),
    )),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line); // 收集日志
      },
    ),
    onError: (Object obj, StackTrace stack) {
      FlutterErrorDetails details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
  );
}

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
                    Navigator.pushNamed(context, Router.Layout,
                        arguments: '构建布局params！');
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
              new Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: new RaisedButton(
                  onPressed: () async {
                    var backResult = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new CountScreen(),
                            fullscreenDialog: true));

                    print(backResult);
                  },
                  child: new Center(
                    child: new Text('计数器'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
