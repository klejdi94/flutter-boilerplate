import 'package:flutter/material.dart';

//Positioned - ListTile - Card - SafeArea
//Esempio di Layout con posizionamento relativo + utilizzo di vari componenti
class Esempio2 extends StatelessWidget {
  static const String routeName = '/selfImprovement/esempio2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(right: 0, top: 0, bottom: 0, child: Sidebar()),
          Positioned(left: 0, top: 0, right: 100, bottom: 0, child: Body()),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        color: Colors.grey.shade300,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: Container()),
              IconButton(onPressed: () {}, icon: Icon(Icons.add, size: 20))
            ],
          ),
        ));
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contatti",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 32,
                ),
                Contact(name: "Mario Rossi", address: "Via delle puglie"),
                Contact(name: "Giuseppe Verdi", address: "Via Italia"),
                Contact(name: "Luca Blu", address: "Via Malta")
              ],
            )));
  }
}

class Contact extends StatelessWidget {
  Contact({@required this.name, @required this.address});
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          this.name,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          this.address,
          style: TextStyle(fontSize: 12),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.blue,
        ),
      ),
    );
  }
}
