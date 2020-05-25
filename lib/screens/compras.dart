import 'package:calculator/widgets/button.dart';
import 'package:calculator/widgets/buttontapped.dart';
import 'package:flutter/material.dart';

class Compras extends StatefulWidget {
  @override
  _ComprasState createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  bool buttonPressed = false;

  void _letsPress() {
    setState(() {
      buttonPressed = !buttonPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF031A8C), Color(0xFF418CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: SafeArea(
              child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Align(
                    child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 50.0,
                          color: Colors.white,
                        )),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(right: 60.0),
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Lista de compras',
                      style: TextStyle(
                          color: Colors.white,
                          height: 3,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  Container(
                    child: GestureDetector(
                      onTap: _letsPress,
                      child: buttonPressed
                          ? ButtonTapped(
                              icon: Icons.home,
                            )
                          : MyButton(icon: Icons.home),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(),
                ],
              ),
            ],
          ))),
    );
  }
}
