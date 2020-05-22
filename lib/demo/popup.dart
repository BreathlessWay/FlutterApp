import 'package:flutter/material.dart';

import 'swiper.dart';

class PopupScreen extends StatefulWidget {
  @override
  PopupScreenState createState() => new PopupScreenState();
}

class PopupScreenState extends State<PopupScreen> {
  Choice _choice = choices[0];

  void _setChoice(Choice choice) {
    setState(() {
      _choice = choice;
    });
  }

  Color _iconColor(choice) {
    return choice == _choice ? Colors.yellow : Colors.black38;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Popup'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                choices[0].icon,
                color: _iconColor(choices[0]),
              ),
              onPressed: () => _setChoice(choices[0])),
          new IconButton(
              icon: new Icon(
                choices[1].icon,
                color: _iconColor(choices[1]),
              ),
              onPressed: () => _setChoice(choices[1])),
          new PopupMenuButton<Choice>(
            onSelected: _setChoice,
            itemBuilder: (BuildContext context) => choices
                .skip(2)
                .map((Choice choice) => new PopupMenuItem(
                      value: choice,
                      child: new Row(
                        children: <Widget>[
                          new Icon(
                            choice.icon,
                            color: _iconColor(choice),
                          ),
                          new Text(choice.title),
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
      body: new Padding(
          padding: EdgeInsets.all(20.0),
          child: new ChoiceCard(choice: _choice)),
    );
  }
}
