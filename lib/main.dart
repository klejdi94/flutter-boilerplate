import 'package:boilerplate/config/config.dart';
import 'package:boilerplate/config/routing/routing.dart';
import 'package:flutter/material.dart';

import 'app/homepage/homepage.dart';
import 'config/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: routesConfig,
    );
  }
}


