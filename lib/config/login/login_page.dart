import 'package:boilerplate/app/homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(loginTitle),
     ),
       body: Center(child: Column(children: <Widget>[
         Container(
           margin: EdgeInsets.all(25),
           child: FlatButton(
             child: Text(loginTitle, style: TextStyle(fontSize: 20.0),),
             color: Colors.blueAccent,
             textColor: Colors.white,
             onPressed: () {
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) =>
                     HomePage(title: titleHome)),
               );
             },
           ),
         ),
       ]
       )
       )
   );

  }
}