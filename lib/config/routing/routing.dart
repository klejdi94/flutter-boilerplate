import 'package:boilerplate/app/form/form_page.dart';
import 'package:flutter/cupertino.dart';

import '../../app/homepage/homepage.dart';
import '../login/login_page.dart';

var routesConfig = <String, WidgetBuilder>{
  '/home': (context) => HomePage(title: 'Flutter Demo Home Page'),
  '/login': (context) => LoginPage(),
  '/createForm': (context) => FormPage()
};