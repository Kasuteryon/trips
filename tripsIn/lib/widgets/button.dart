// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  //onst ButtonPurple({ Key? key }) : super(key: key);

  String buttonText = "Navegar";
  VoidCallback onPressed;

  ButtonPurple({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFF449DD1),
                  Color(0xFF192BC2),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontFamily: "Epilogue",
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
