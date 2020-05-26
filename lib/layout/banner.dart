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
            gradient: new LinearGradient(
              begin: const Alignment(0.0, -1.0),
              end: const Alignment(0.0, 0.6),
              colors: <Color>[
                const Color(0xffef5350),
                const Color(0x00ef5350)
              ],
            ),
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
