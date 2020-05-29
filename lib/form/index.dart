import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() => new FormScreenState();
}

class FormScreenState extends State<StatefulWidget> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _controller = new TextEditingController();

  String _email;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleSubmit(BuildContext context) {
    bool valid = formKey.currentState.validate();
    print(valid);
    print(_email);
    if (valid) {
      formKey.currentState.save();
      print(_email);
    }
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Alert'),
          content: Text('You typed ${_controller.text}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('表单'),
      ),
      body: new Form(
          key: formKey,
          child: new Container(
            padding: EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  validator: (value) =>
                      !value.contains('@') ? 'Not a valid email.' : null,
                  onSaved: (val) => _email = val,
                  decoration: new InputDecoration(
                      icon: new Icon(Icons.map),
                      border: new OutlineInputBorder(),
                      hintText: '请输入',
                      labelText: '输入框：'),
                ),
                new RaisedButton(
                    child: const Text('点我'),
                    onPressed: () => handleSubmit(context))
              ],
            ),
          )),
    );
  }
}
