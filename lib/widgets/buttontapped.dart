import 'package:flutter/material.dart';

class ButtonTapped extends StatelessWidget{

  final icon;

  ButtonTapped({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(

        padding: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Icon(icon, size: 35, color: Colors.blue[700],),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[300],
              boxShadow: [
                BoxShadow(
                    color: Colors.blue,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.blue[600],
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue[700],
                    Colors.blue[600],
                    Colors.blue[500],
                    Colors.blue[200],
                  ],
                  stops: [
                    0,
                    0.1,
                    0.3,
                    1
                  ]
              )
          ),

        ),

        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.blue[600],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.blue,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[200],
                  Colors.blue[300],
                  Colors.blue[400],
                  Colors.blue[500],
                ],
                stops: [
                  0.1,
                  0.3,
                  0.8,
                  1
                ]
            )
        ),

      ),
    );
  }

}