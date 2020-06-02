import 'package:flutter/material.dart';

class CountScreen extends StatefulWidget {
  final String title = '计数器';

  @override
  CountScreenState createState() => new CountScreenState();
}

class CountScreenState extends State<CountScreen> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${widget.title}'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('计数器', style: Theme.of(context).textTheme.headline3),
            new Text(
              '当前基数结果：$count',
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: increment,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
