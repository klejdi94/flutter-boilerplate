import 'package:boilerplate/app/controllers/chuck_norris_ctr.dart';
import 'package:boilerplate/app/homepage/chuck_joke.dart';
import 'package:boilerplate/app/model/chuck_norris.dart';
import 'package:boilerplate/config/http/response.dart';
import 'package:boilerplate/shared/dialog/popup.dart';
import 'package:boilerplate/shared/dialog/popup_service.dart';
import 'package:boilerplate/shared/loading/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/menu/nav_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChuckNorrisController _controller ;

  @override
  void initState() {
    super.initState();
    _controller = ChuckNorrisController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () => _controller.fetchChuckyJoke(),
        child: StreamBuilder<Response<ChuckNorris>>(
          stream: _controller.chuckDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return ChuckJoke(displayJoke: snapshot.data.data);
                  break;
                case Status.ERROR:
                  return buildPopupDialog(context,
                      new Popup("Errore", snapshot.data.message, PopupButton.close));
                  break;
              }
            }
            return Container();
          },
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}