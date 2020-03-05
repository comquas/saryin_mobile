import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:saryin/utils/alert.dart';
import 'package:saryin/utils/graph_ds.dart';
import 'package:saryin/models/user.dart';

class LoginScreen extends StatefulWidget {
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  GraphDatasource ds = new GraphDatasource();
  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: _buildBar(context),
        body: new Container(
            padding: EdgeInsets.all(16.0),
            child: new Column(
              children: <Widget>[
                _buildTextFields(),
                _buildButtions(),
              ],
            )));
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Saryin"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Container(
          child: new TextField(
            controller: _emailFilter,
            decoration: new InputDecoration(labelText: 'Email'),
          ),
        ),
        new Container(
            child: new TextField(
          controller: _passwordFilter,
          decoration: new InputDecoration(labelText: 'Password'),
          obscureText: true,
        ))
      ],
    ));
  }

  Widget _buildButtions() {
    return new Container(
      child: new Column(children: <Widget>[
        new RaisedButton(onPressed: _loginPressed, child: new Text('Login'))
      ]),
    );
  }

  void _loginPressed() {
    if (_email == "") {
      return showError(context, "Something went wrong", "Email is empty");
    }
    if (_password == "") {
      return showError(context, "Something went wrong", "Password is empty");
    } else if (!EmailValidator.validate(_email)) {
      return showError(context, "Something went wrong", "Invalid email format");
    }
    ds.login(_email, _password).then((User user) {
      showError(context, "Success Login", user.name);
    }).catchError((e) {
      showError(context, "Cannot login", e.toString());
    });
  }
}
