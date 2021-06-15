import 'package:flutter/material.dart';

//Drawer - Switch - AppBar(con actions) - PopupMenuButton
//Esempio di Drawer con Switch + es Appbar con actions e componente PopupMenuButton
class Esempio3 extends StatelessWidget {
  static const String routeName = '/selfImprovement/esempio3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playlist"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Logout"),
                    )
                  ])
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.album),
                title: Text("Soldi"),
                subtitle: Text("Cantata da Mahmood"),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.album),
                title: Text("Soldi"),
                subtitle: Text("Cantata da Mahmood"),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}

class Drawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  bool _automaticLogin = false;
  void onAutomaticLoginChange(bool value) {
    setState(() {
      _automaticLogin = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 32,
              ),
              ListTile(
                title: Text("Login Automatico"),
                subtitle:
                    Text("Quando attivo, l'utente è loggato automaticamente"),
                trailing: Switch(
                  value: _automaticLogin,
                  onChanged: onAutomaticLoginChange,
                ),
              )
            ],
          ),
        ));
  }
}
