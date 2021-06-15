import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({@required this.home});
  final Widget home;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: home,
    );
  }
}
