import 'package:boilerplate/app/form/form_page.dart';
import 'package:boilerplate/app/self_improvement/self_improvement.dart';
import 'package:boilerplate/app/self_improvement/esempio1/esempio1.dart';
import 'package:boilerplate/app/self_improvement/esempio2/esempio2.dart';
import 'package:boilerplate/app/self_improvement/esempio3/esempio3.dart';
import 'package:boilerplate/app/self_improvement/esempio4/esempio4.dart';
import 'package:boilerplate/app/self_improvement/esempio5/esempio5.dart';
import 'package:boilerplate/app/self_improvement/esempio6/esempio6.dart';
import 'package:boilerplate/app/self_improvement/esempio7/esempio7.dart';
import 'package:boilerplate/app/self_improvement/esempio8/esempio8.dart';
import 'package:boilerplate/app/self_improvement/esempio9/esempio9.dart';
import 'package:boilerplate/app/self_improvement/esempio10/esempio10.dart';
import 'package:boilerplate/app/self_improvement/esempio11/esempio11.dart';

import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../../app/homepage/homepage.dart';
import '../login/login_page.dart';

var routesConfig = <String, WidgetBuilder>{
  '/home': (context) => HomePage(title: 'Flutter Demo Home Page'),
  '/login': (context) => LoginPage(),
  '/createFormm': (context) => FormPage(),
  SelfImprovement.routeName: (context) => SelfImprovement(),
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Esempio1.routeName:
      {
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: Esempio1());
      }
    case Esempio2.routeName:
      {
        return PageTransition(
            type: PageTransitionType.leftToRight, child: Esempio2());
      }
    case Esempio3.routeName:
      {
        return PageTransition(
            type: PageTransitionType.leftToRightJoined,
            child: Esempio3(),
            childCurrent: SelfImprovement());
      }
    case Esempio4.routeName:
      {
        return PageTransition(
            type: PageTransitionType.leftToRightWithFade, child: Esempio4());
      }
    case Esempio5.routeName:
      {
        return PageTransition(
            type: PageTransitionType.rightToLeft, child: Esempio5());
      }
    case Esempio6.routeName:
      {
        return PageTransition(
            type: PageTransitionType.rightToLeftJoined,
            child: Esempio6(),
            childCurrent: SelfImprovement());
      }
    case Esempio7.routeName:
      {
        return PageTransition(
            type: PageTransitionType.rightToLeftWithFade, child: Esempio7());
      }
    case Esempio8.routeName:
      {
        return PageTransition(type: PageTransitionType.fade, child: Esempio8());
      }
    case Esempio9.routeName:
      {
        return PageTransition(
            type: PageTransitionType.rotate,
            child: Esempio9(),
            alignment: Alignment.center);
      }
    case Esempio10.routeName:
      {
        return PageTransition(
            type: PageTransitionType.scale,
            child: Esempio10(),
            alignment: Alignment.center);
      }
    case Esempio11.routeName:
      {
        return PageTransition(
            type: PageTransitionType.size,
            child: Esempio11(),
            alignment: Alignment.center);
      }
  }
  return null;
}
