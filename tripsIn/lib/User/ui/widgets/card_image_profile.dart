// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trips/widgets/fab_green.dart';

class CardImageProfile extends StatelessWidget {
  //const CardImageProfile({Key? key}) : super(key: key);

  String path = "assets/img/rio.jpg";
  String title = "Rio San Juan";
  String description = "Ven y visita El 'Castillo' en Rio San Juan.";
  int steps = 100000;

  CardImageProfile(this.path, this.title, this.description, this.steps);

  @override
  Widget build(BuildContext context) {
    final image = Container(
      height: 250.0,
      width: 400.0,
      margin: EdgeInsets.only(top: 80.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    final detail = Container(
        height: 150.0,
        width: 400,
        margin: EdgeInsets.only(right: 35.0, left: 35.0, bottom: 40.0),
        padding: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            shape: BoxShape.rectangle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 7.0))
            ]),
        child: Column(
          children: [
            Container(
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: "Epilogue",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(right: 30.0, left: 30.0),
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: "Epilogue",
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(right: 30.0, left: 30.0),
              child: Text(
                steps.toString() + " pasos",
                style: TextStyle(
                    fontFamily: "Epilogue",
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));

    return Stack(
      alignment: Alignment(0, 2.3),
      children: [
        image,
        Stack(
          alignment: Alignment(0.7, 0.7),
          children: [
            detail,
            FloatingActionButtonGreen(
              iconData: Icons.favorite,
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
