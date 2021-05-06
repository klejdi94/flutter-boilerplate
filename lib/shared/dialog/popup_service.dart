import 'package:boilerplate/shared/dialog/popup.dart';
import 'package:flutter/material.dart';

  Widget buildPopupDialog(BuildContext context,Popup conf) {
  return new AlertDialog(
    title:  Text(conf.title),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(conf.message),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Text(conf.buttonType.toShortString()),
      ),
    ],
  );
}