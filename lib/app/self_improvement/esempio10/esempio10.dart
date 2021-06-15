import 'package:boilerplate/app/self_improvement/esempio10/pages/detail.dart';
import 'package:boilerplate/app/self_improvement/esempio10/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

//Casella di posta con es di routing + RouteSettings(passaggio parametri tra schermate)
//Es di 4 utilizzi di routing(in mailRow()) + utilizzo di una Route RouteSettings(arguments in mailRow() es 4)
class Esempio10 extends StatelessWidget {
  static const String routeName = '/selfImprovement/esempio10';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      //routes: {'mail/detail': (context) => DetailPage()},
      onGenerateRoute: (settings) {
        if (settings.name == DetailPage.routeName) {
          return PageTransition(
              type: PageTransitionType.bottomToTop,
              child: DetailPage(),
              settings: settings);
        } else
          return null;
      },
      home: HomePageMail(),
    );
  }
}
