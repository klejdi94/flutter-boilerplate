import 'package:boilerplate/app/homepage/homepage.dart';
import 'package:boilerplate/config/config.dart';
import 'package:boilerplate/config/menu/nav_drawer.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(createFormTitle),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                hintText: "First Name", labelText: "First Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Last Name", labelText: "Last Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter surname';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Phone Number", labelText: "Phone Number"),
            validator: (value) {
              if (value == null ||value.isEmpty) {
                return 'Please enter some text';
              } else if (!isNumeric(value)) {
                return 'Please enter a valid Phone number';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Form Data')));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        HomePage(title: titleHome)),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    ));
  }
}

bool isNumeric(String s) {
  try {
    return double.parse(s) != null;
  } catch (e) {
    return false;
  }
}
