import 'package:flutter/material.dart';

class LayoutButton extends StatelessWidget {
  Widget _buildItem({IconData icon, String title, Color color}) {
    return new Transform(
      alignment: Alignment.center,
      transform: new Matrix4.identity()..rotateZ(15 * 3.1415927 / 180),
      child: new Column(
        children: <Widget>[
          new Icon(icon),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Transform(
              alignment: Alignment.center,
              transform: new Matrix4.identity()..scale(1.4),
              child: new Text(
                '$title',
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).primaryColor;

    return new Theme(
      data: Theme.of(context)
          .copyWith(iconTheme: new IconThemeData(color: Colors.yellow)),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildItem(icon: Icons.call, title: 'CALL', color: _color),
          _buildItem(icon: Icons.near_me, title: 'ROUTE', color: _color),
          _buildItem(icon: Icons.share, title: 'SHARE', color: _color),
        ],
      ),
    );
  }
}
