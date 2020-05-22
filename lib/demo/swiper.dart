import 'package:flutter/material.dart';

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

/// var a = const []
/// a[0]=1
/// 重新赋值只有运行时候才报错，编辑器不会报错
const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class SwipeScreen extends StatefulWidget {
  @override
  SwipeScreenState createState() => new SwipeScreenState();
}

class SwipeScreenState extends State<SwipeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: choices.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _move(int index) {
    int nextPage = _tabController.index + index;

    if (nextPage < 0) {
      nextPage = _tabController.length - 1;
    }
    if (nextPage == _tabController.length) {
      nextPage = 0;
    }

    _tabController.animateTo(nextPage);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('App Bar'),
        leading: new IconButton(
          onPressed: () => _move(-1),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            onPressed: () => _move(1),
          ),
        ],
        bottom: new PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: new Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: new Container(
              height: 40.0,
              alignment: Alignment.center,
              child: new TabPageSelector(controller: _tabController),
            ),
          ),
        ),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: choices
              .map((e) => new ChoiceCard(
                    choice: e,
                  ))
              .toList()),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  ChoiceCard({Key key, this.choice}) : super(key: key);

  TextStyle textStyle(BuildContext context) =>
      Theme.of(context).textTheme.headline4;

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(16.0),
        child: new Card(
          color: Colors.grey[200],
          child: new Center(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(
                  choice.icon,
                  size: 128.0,
                  color: textStyle(context).color,
                ),
                new Text(
                  choice.title,
                  style: textStyle(context),
                ),
              ],
            ),
          ),
        ));
  }
}
