import 'package:flutter/material.dart';
import 'package:flutter_draggable/second_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color color1 = Colors.red;
  Color color2 = Colors.amber;
  Color targetColor;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Main Page"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Draggable<Color>(
                      data: color1,
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            color: color1,
                            shape: StadiumBorder(),
                            elevation: 3,
                          )),
                      childWhenDragging: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            color: Colors.grey,
                            shape: StadiumBorder(),
                          )),
                      feedback: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            color: color1.withOpacity(0.7),
                            shape: StadiumBorder(),
                          )),
                    ),
                    Draggable<Color>(
                      data: color2,
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            color: color2,
                            shape: StadiumBorder(),
                            elevation: 3,
                          )),
                      childWhenDragging: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            color: Colors.grey,
                            shape: StadiumBorder(),
                          )),
                      feedback: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            color: color2.withOpacity(0.7),
                            shape: StadiumBorder(),
                          )),
                    )
                  ]),
              DragTarget<Color>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  isAccepted = true;
                  targetColor = value;
                },
                builder: (context, candidates, rejected) {
                  return (isAccepted)
                      ? SizedBox(
                          height: 100,
                          width: 100,
                          child: Material(
                            color: targetColor,
                            shape: StadiumBorder(),
                            elevation: 3,
                          ))
                      : SizedBox(
                          height: 100,
                          width: 100,
                          child: Material(
                            color: Colors.black38,
                            shape: StadiumBorder(),
                            elevation: 3,
                          ));
                },
              ),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SecondPage();
                    }));
                  },
                  child: Text('Go To Second Page'))
            ],
          ),
        ),
      ),
    );
  }
}
