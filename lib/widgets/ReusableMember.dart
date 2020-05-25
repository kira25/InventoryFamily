import 'package:flutter/material.dart';

class ReusableMember extends StatelessWidget {
  ReusableMember({this.memberEdad, this.memberName, this.memberPhoneNumber});

  final String memberName;
  final int memberEdad;
  final int memberPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(width: 220, height: 90),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFa7ff83), Color(0xFF418CFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(blurRadius: 10.0, offset: Offset(10, 10))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      memberName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text('$memberEdad\nCel:$memberPhoneNumber'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
