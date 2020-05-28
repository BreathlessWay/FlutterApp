import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() => new FormScreenState();
}

class FormScreenState extends State<StatefulWidget> {
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('表单'),
      ),
      body: new Container(
        padding: EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new TextFormField(
              controller: _controller,
              decoration: new InputDecoration(border: new OutlineInputBorder()),
            ),
            new RaisedButton(
                child: const Text('点我'),
                onPressed: () => showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text('Alert'),
                        content: Text('You typed ${_controller.text}'),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
