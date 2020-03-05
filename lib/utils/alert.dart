import 'package:flutter/material.dart';

void showError(BuildContext context, String titleMessage, String contentMessage) {
    showDialog(
        context: context,
        builder: (BuildContext contenxt) {
          return AlertDialog(
            title: new Text(titleMessage),
            content: new Text(contentMessage),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(contenxt).pop();
                  },
                  child: new Text("OK"))
            ],
          );
        });
  }