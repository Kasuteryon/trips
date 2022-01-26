// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trips/widgets/fab_green.dart';

class CardImage extends StatelessWidget {
  //const CardImage({Key? key}) : super(key: key);

  String pathImage = "assets/img/san.jpg";
  double height = 350.0;
  double width = 250.0;
  double left = 20.0;
  VoidCallback onPressed;
  final IconData iconData;

  CardImage(
      {required this.pathImage,
      required this.height,
      required this.width,
      required this.left,
      required this.iconData,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left: left),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(pathImage), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
              // shadow
              spreadRadius: .5,
              // set effect of extending the shadow
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ]),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: () {},
        )
      ],
    );
  }
}
