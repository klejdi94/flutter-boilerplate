import 'package:flutter/cupertino.dart';

import '../../app/homepage/homepage.dart';
import '../login/login_page.dart';

var routesConfig = <String, WidgetBuilder>{
  '/home': (context) => HomePage(title: 'Flutter Demo Home Page'),
  '/login': (context) => LoginPage()
};