import 'package:boilerplate/config/login/login_page.dart';
import 'package:boilerplate/shared/dialog/popup.dart';
import 'package:boilerplate/shared/dialog/popup_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav_titles.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              sideMenuTitle,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text(benvenutiTitle),
            onTap: () => {
              _openPopup(context,benvenutiTitle,'ciao')
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text(profiloTitle),
            onTap: () => {_openPopup(context,profiloTitle,'ciao')},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(settingsTitle),
            onTap: () => {_openPopup(context,settingsTitle,'ciao')},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text(feedbackTitle),
            onTap: () => {_openPopup(context,feedbackTitle,'ciao')},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(logoutTitle),
            onTap: () => {
              _openPopup(context,logoutTitle,'ciao'),
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>
                  LoginPage()
                ),
            )
            },
          ),
        ],
      ),
    );
  }
}

_openPopup(context,title,message){
  showDialog(
    context: context,
    builder: (BuildContext context) =>
        buildPopupDialog(context,
            new Popup(title,message,PopupButton.close)),
  );
}