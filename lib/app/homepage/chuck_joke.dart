import 'package:boilerplate/app/model/chuck_norris.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChuckJoke extends StatelessWidget {
  final ChuckNorris displayJoke;

  const ChuckJoke({Key key, this.displayJoke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.black12,
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(context),
            _getContent(),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Container(
        decoration: BoxDecoration(
        ),
        child: null /* add child content here */,
      ),
    );
  }

  Container _getGradient(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: 90.0),
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x00736AB7), new Color(0xFF333333)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 280, 0.0, 32.0),
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),

          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(5, 15, 0.0, 0.0),
              ),
              new Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  displayJoke.value,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
