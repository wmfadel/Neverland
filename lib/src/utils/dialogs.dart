import 'package:flutter/material.dart';
import '../models/auth_error.dart';

class Dialogs {
  showLoginError(BuildContext context, AuthError error) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text('Error ${error.status_code?? ''}'),
            content: Text(error.status_message??''),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }


  showTokenError(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text('Error 404'),
            content: Text('No request token found try again later'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }
}
