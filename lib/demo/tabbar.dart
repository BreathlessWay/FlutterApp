import 'package:flutter/material.dart';

import 'swiper.dart';

/// DefaultTabController默认提供TabBar的controller可以用在StatelessWidget上
class TabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
              title: new Text('tar bar'),
              bottom: new TabBar(
                  isScrollable: true,
                  tabs: choices
                      .map((Choice choice) => new Tab(
                            text: choice.title,
                            icon: new Icon(choice.icon),
                          ))
                      .toList())),
          body: new TabBarView(
              children: choices
                  .map((Choice choice) => new ChoiceCard(choice: choice))
                  .toList()),
        ));
  }
}
