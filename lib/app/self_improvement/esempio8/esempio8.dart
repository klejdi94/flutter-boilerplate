import 'package:boilerplate/app/self_improvement/esempio8/article.dart';
import 'package:flutter/material.dart';

import 'package:boilerplate/app/self_improvement/esempio8/newsStream.dart';

//Esempio di utilizzo dello Streams
//StreamBuilder(prende in carico uno Stream<T>, lato View) - StreamController(prende in input dei Callback, richiamati durante il life cycle dello stream)
//Cosa vogliamo: Avere uno stream di notizia periodica (10s) e che verrà presa da un'API esterna
class Esempio8 extends StatelessWidget {
  static const String routeName = '/selfImprovement/esempio8';
  const Esempio8({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Streams"),
      ),
      body: StreamBuilder(
        stream: NewsStream().getStream(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              {
                Article article = snapshot.data as Article;
                //Recezione Dati
                return Center(
                    child: ListTile(
                  title: Text(article.title ?? "-"),
                  subtitle: Text(article.content ?? "-"),
                ));
              }
            default:
              {
                return Center(child: CircularProgressIndicator());
              }
          }
        },
      ),
    );
  }
}
