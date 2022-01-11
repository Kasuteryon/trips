import 'package:flutter/material.dart';
import 'package:trips/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage("assets/img/ometepe.jpg"),
          CardImage("assets/img/peña.jpg"),
          CardImage("assets/img/rio.jpg"),
          CardImage("assets/img/san.jpg"),
        ],
      ),
    );
  }
}
