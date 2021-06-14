import 'package:flutter/material.dart';

//StatefulWidget
//Es Carta di credito con utilizzo di uno Stateful Widget
class Esempio1 extends StatelessWidget {
  static const String routeName = '/selfImprovement/esempio1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Le tue carte di credito"),
        ),
        body: Column(
          children: [
            BankView(bank: "ING"),
            BankView(bank: "Poste Italiane"),
          ],
        ));
  }
}

class BankView extends StatefulWidget {
  BankView({@required this.bank});
  final String bank;

  @override
  State<BankView> createState() {
    return _BankViewState();
  }
}

class _BankViewState extends State<BankView> {
  bool active = false;

  void toggleCard() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: active ? Colors.white : Colors.grey.shade400,
      child: Row(
        children: [
          Icon(Icons.credit_card, size: 14),
          SizedBox(
            width: 16,
          ),
          Text(widget.bank, style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: SizedBox()),
          FlatButton(
              onPressed: toggleCard,
              child: Text(active ? "Disattiva" : "Attiva"))
        ],
      ),
    );
  }
}
