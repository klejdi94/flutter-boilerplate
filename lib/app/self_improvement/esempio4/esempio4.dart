import 'package:flutter/material.dart';

class Day {
  final int nr;
  String task;

  Day(this.nr);
}

class Month {
  final String name;
  List<Day> days;

  Month(this.name, int daysNr) {
    days = List.generate(daysNr, (daysNr) => Day(daysNr + 1));
  }
}

final month = [
  Month("Gennaio", 31),
  Month("Febbraio", 28),
  Month("Marzo", 31),
  Month("Aprile", 30),
  Month("Maggio", 31),
  Month("Giugno", 30),
  Month("Luglio", 31),
  Month("Agosto", 31),
  Month("Settembre", 30),
  Month("Ottobre", 31),
  Month("Novembre", 30),
  Month("Dicembre", 31)
];

//Drawer con ListView.separated + ListView & BottomSheet
//Calendario con Drawer + ListView con separatori(per mesi) e ListView "classico"(per giorni) + es BottomSheet
class Esempio4 extends StatefulWidget {
  static const String routeName = '/selfImprovement/esempio4';

  @override
  _Esempio4State createState() => _Esempio4State();
}

class _Esempio4State extends State<Esempio4> {
  var _taskController = TextEditingController();
  int _selectedMonthIndex = 0;

  void onMonthSelected(int index) {
    setState(() {
      _selectedMonthIndex = index;
    });
    Navigator.of(context).pop();
  }

  void onNoteSubmit(Day day) {
    String task = _taskController.text.trim();
    setState(() {
      day.task = task;
      _taskController.clear();
    });
    Navigator.of(context).pop();
  }

  void onDaySelected(BuildContext context, Day day) {
    showBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    day.nr.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(month[_selectedMonthIndex].name),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _taskController,
                  decoration: InputDecoration(hintText: "Inserisci una nota"),
                ),
                SizedBox(
                  height: 32,
                ),
                MaterialButton(
                  onPressed: () {
                    onNoteSubmit(day);
                  },
                  height: 40,
                  child: Text(
                    "Salva nota",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendario"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: month[_selectedMonthIndex].days.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  onDaySelected(
                      context, month[_selectedMonthIndex].days[index]);
                },
                title:
                    Text(month[_selectedMonthIndex].days[index].nr.toString()),
                subtitle: Text(month[_selectedMonthIndex].days[index].task ??
                    "Nessuna Nota"),
              ),
            );
          }),
      drawer: Container(
        width: 300,
        color: Colors.white,
        child: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                    color: _selectedMonthIndex == index
                        ? Colors.grey.shade300
                        : Colors.transparent,
                    child: ListTile(
                      onTap: () {
                        onMonthSelected(index);
                      },
                      title: Text(month[index].name),
                    ));
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                );
              },
              itemCount: month.length),
        ),
      ),
    );
  }
}
