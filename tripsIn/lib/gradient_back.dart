// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  //const GradientBack({Key? key}) : super(key: key);

  String title = "Popular";
  double altura = 250.0;

  GradientBack(this.title, this.altura);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF449DD1),
                Color(0xFF192BC2),
                //Color(0xFF150578),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Epilogue",
            fontWeight: FontWeight.bold),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}
