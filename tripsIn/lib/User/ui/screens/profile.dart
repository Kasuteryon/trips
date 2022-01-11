// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trips/User/ui/widgets/card_image_profile.dart';
import 'package:trips/widgets/gradient_back.dart';
//import 'package:trips/card_photo_detail.dart';
import 'profile_info.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget CreateIconButton(IconData iconData,
        {bool mini = false, bool active = false}) {
      return Expanded(
        flex: 1,
        child: Container(
          height: mini ? 35 : 55,
          width: mini ? 35 : 55,
          child: Center(
            child: Icon(
              iconData,
              color: Color(0xFF584CD1),
              size: mini ? 20 : 45,
            ),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? Colors.white : Colors.white54),
        ),
      );
    }

    final widgetMenu = Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          CreateIconButton(Icons.bookmark_border, mini: true, active: true),
          CreateIconButton(Icons.card_giftcard, mini: true),
          CreateIconButton(Icons.add, active: true),
          CreateIconButton(Icons.mail_outline, mini: true),
          CreateIconButton(Icons.person, mini: true),
        ],
      ),
    );

    return Stack(
      children: [
        GradientBack("Perfil", 450),
        Positioned(
          child: Icon(
            Icons.settings,
            size: 15,
            color: Colors.white38,
          ),
          right: 20,
          top: 45,
        ),
        Column(
          children: [
            ProfileInfo("assets/img/lebni.jpg", "Lebni Lowen",
                "ernestolebni123@gmail.com"),
            widgetMenu
          ],
        ),
        ListView(
          padding: EdgeInsets.only(left: 12, right: 12, top: 270),
          children: [
            CardImageProfile(
                "assets/img/ometepe.jpg",
                "Isla de Ometepe",
                "Déjate hechizar por la magia isleña que ometepe ofrece.",
                58000),
            CardImageProfile("assets/img/peña.jpg", "Jinotega",
                "Descubre todo lo que Jinotega tiene por ofrecer.", 678504),
            CardImageProfile("assets/img/san.jpg", "San Juan del Sur",
                "Arena, mar y sabor Nicaraguense.", 10000),
            CardImageProfile("assets/img/rio.jpg", "Rio San Juan",
                "Rio San Juan 100% Nicaraguense!.", 58000),
          ],
        )
      ],
    );
  }
}
