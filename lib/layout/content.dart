import 'package:flutter/material.dart';

class LayoutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: const Color(0xcc000000),
              offset: new Offset(0.0, 2.0),
              blurRadius: 4.0,
            ),
            new BoxShadow(
              color: const Color(0x80000000),
              offset: new Offset(0.0, 6.0),
              blurRadius: 20.0,
            ),
          ],
          color: Colors.yellow,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0))),
      child: new Card(
        child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Text(
            '''
          Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
      ''',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
