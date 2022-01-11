// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trips/fab_green.dart';

class CardImage extends StatelessWidget {
  //const CardImage({Key? key}) : super(key: key);

  String pathImage = "assets/img/omete.jpg";

  CardImage(this.pathImage);
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: EdgeInsets.only(top: 80.0, left: 20.0),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(pathImage), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0XFF7090B0),
              spreadRadius: 0.10,
              blurRadius: 15.0,
              offset: Offset(0.0, 5.5),
            )
          ]),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [card, FloatingActionButtonGreen()],
    );
  }
}
