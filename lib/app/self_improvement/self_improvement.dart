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
import 'package:boilerplate/config/menu/nav_titles.dart';
import 'package:flutter/material.dart';

class SelfImprovementItem {
  final String title;
  final String subtitle;
  final String routeName;

  SelfImprovementItem(
      {@required this.title,
      @required this.subtitle,
      @required this.routeName});
}

final items = [
  SelfImprovementItem(
      title: "1 - StatefulWidget",
      subtitle: "Es Carta di credito con utilizzo di uno Stateful Widget",
      routeName: Esempio1.routeName),
  SelfImprovementItem(
      title: "2 - Positioned - ListTile - Card - SafeArea",
      subtitle:
          "Layout con posizionamento relativo + es di componenti Positioned - ListTile - Card - SafeArea",
      routeName: Esempio2.routeName),
  SelfImprovementItem(
      title: "3 - Drawer - Switch - AppBar(con actions) e PopupMenuButton",
      subtitle:
          "Esempio di Drawer con Switch + es Appbar con actions e componente PopupMenuButton",
      routeName: Esempio3.routeName),
  SelfImprovementItem(
      title: "4 - Drawer con ListView.separated + ListView & BottomSheet",
      subtitle:
          "Calendario con Drawer + ListView con separatori(per mesi) e ListView \"classico\"(per giorni) + es BottomSheet",
      routeName: Esempio4.routeName),
  SelfImprovementItem(
      title: "5 - Drawer con ListView.separated + GridView & BottomSheet",
      subtitle:
          "Calendario con Drawer + ListView con separatori(per mesi) e GridView (per giorni) + es BottomSheet",
      routeName: Esempio5.routeName),
  SelfImprovementItem(
      title: "6 - PageView + Dialog con modulo Login",
      subtitle:
          "Es di PageView + es Dialog(Modale) con form di Login(ultima pagina icona V)",
      routeName: Esempio6.routeName),
  SelfImprovementItem(
      title:
          "7 - Future - http - FutureBuilder - url_launcher - CircularProgressIndicator(loader)",
      subtitle:
          "Accesso api Hacker News usando package http + utilizzo Future e FutureBuilder(per la gestione view della Future) + link esterno  con package url_launcher",
      routeName: Esempio7.routeName),
  SelfImprovementItem(
      title: "8 - Esempio di utilizzo dello Streams",
      subtitle:
          "StreamBuilder(prende in carico uno Stream<T>, lato View) - StreamController(prende in input dei Callback, richiamati durante il life cycle dello stream)",
      routeName: Esempio8.routeName),
  SelfImprovementItem(
      title:
          "9 - (1)CustomScrollView - (2)SliverToBoxAdapter - (3)SliverGrid - (4)BottomNavigationBar",
      subtitle:
          "(1)Rende una pagina, composta da componenti eterogenee, scrollabile (2)Vrappa un componente classico in uno sliver (3)è una GridView di tipo sliver (4)Barra di navigazione inferiore - Uno Sliver è una porzione di pagina scrollabile",
      routeName: Esempio9.routeName),
  SelfImprovementItem(
      title:
          "10 - Casella di posta con es di routing + RouteSettings(passaggio parametri tra schermate)",
      subtitle:
          "Es di 4 utilizzi di routing(in mailRow()) + utilizzo di una Route con RouteSettings(arguments in mailRow() es 4) ",
      routeName: Esempio10.routeName),
  SelfImprovementItem(
      title: "11 - App Ansa.it - Uso di svariati componenti",
      subtitle:
          "Nuovi: BottomNavigationBar - Uso Assets - PageController & .animateToPage - http - url_launcher",
      routeName: Esempio11.routeName),
];

class SelfImprovement extends StatelessWidget {
  static const String routeName = '/selfImprovement';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selfImprovement),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, items[index].routeName);
                },
                title: Text('${items[index].title}'),
                subtitle: Text(items[index].subtitle),
              ),
            );
          }),
    );
  }
}
