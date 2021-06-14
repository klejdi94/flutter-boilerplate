import 'package:flutter/cupertino.dart';

class MailModel {
  const MailModel({
    @required this.title,
    @required this.content,
    @required this.date,
  });

  final String title;
  final String content;
  final String date;
}
