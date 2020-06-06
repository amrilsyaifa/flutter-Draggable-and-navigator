import 'package:flutter/material.dart';
import 'package:flutter_draggable/main_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MainPage();
                }));
              },
              child: Text("Login")),
        ),
      ),
    );
  }
}
