import 'package:flutter/material.dart';

class LayoutBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        Image.asset(
          'static/images/16f356f29ef7c885.jpg',
          height: 240.0,
          fit: BoxFit.cover,
        ),
        new Container(
          padding: EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            color: Colors.black45,
            borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
          ),
          child: new Text(
            'Layout Stack',
            style: new TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        )
      ],
    );
  }
}
