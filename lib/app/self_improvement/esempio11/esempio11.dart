import 'package:flutter/material.dart';

import 'package:boilerplate/app/self_improvement/esempio11/components/app_scaffold.dart';
import 'package:boilerplate/app/self_improvement/esempio11/pages/home.dart';

//App Ansa.it - Uso di svariati componenti
//Nuovi: BottomNavigationBar - Uso Assets - PageController & .animateToPage - http - url_launcher

class Esempio11 extends StatelessWidget {
  static const String routeName = '/selfImprovement/esempio11';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(home: HomePageAnsa());
  }
}
