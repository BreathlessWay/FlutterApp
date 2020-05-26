import 'package:flutter/material.dart';

class LayoutHeader extends StatefulWidget {
  @override
  LayoutHeaderState createState() => new LayoutHeaderState();
}

class LayoutHeaderState extends State<LayoutHeader> {
  bool _isFavorite = true;
  int _favoriteCount = 41;

  void handleFavorite() {
    if (_isFavorite) {
      setState(() {
        _isFavorite = false;
        _favoriteCount = 40;
      });
    } else {
      setState(() {
        _isFavorite = true;
        _favoriteCount = 41;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// Text只是展示组件，没有padding
                /// 布局要用布局组件 Container Padding...
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          )),
          new IconButton(
              icon: new Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                color: Colors.red[500],
              ),
              onPressed: handleFavorite),
          new Text('$_favoriteCount'),
        ],
      ),
    );
  }
}
