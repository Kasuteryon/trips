// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/Place/ui/screens/add_place_screen.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/User/model/user.dart';
import 'package:trips/User/ui/widgets/card_image_profile.dart';
import 'package:trips/User/ui/widgets/icon_button.dart';
import 'package:trips/widgets/gradient_back.dart';
//import 'package:trips/card_photo_detail.dart';
import 'profile_info.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc? userBloc;
  UserModel? user;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc!.streamFirebase,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot, context);
          case ConnectionState.done:
            return showProfileData(snapshot, context);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot, BuildContext context) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No iniciado sesion");

      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Center(
            child: Column(
          children: [
            CircularProgressIndicator(),
            Text("No se pudo cargar la información. Logea de nuevo.")
          ],
        )),
      );
    } else {
      user = UserModel(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL,
          myPlaces: [],
          myFavoritePlaces: []);

      final widgetMenu = Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            CreateIconButton(
              Icons.vpn_key,
              mini: true,
              active: true,
              onPressed: () {},
            ),
            CreateIconButton(
              Icons.add,
              mini: false,
              active: true,
              onPressed: () {
                File img = File.fromUri(Uri.parse("./assets/img/san.jpg"));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AddPlaceScreen(image: img)));

                print(img);
              },
            ),
            CreateIconButton(
              Icons.exit_to_app,
              mini: true,
              active: true,
              onPressed: () {
                userBloc!.signOut();
              },
            ),
          ],
        ),
      );
      return Stack(
        children: [
          GradientBack(title: "Perfil", altura: 450.0),
          Positioned(
            child: Icon(
              Icons.settings,
              size: 20,
              color: Colors.white38,
            ),
            right: 20,
            top: 85,
          ),
          Column(
            children: [
              ProfileInfo(user),
              widgetMenu,
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  children: [
                    CardImageProfile(
                        "assets/img/ometepe.jpg",
                        "Isla de Ometepe",
                        "Déjate hechizar por la magia isleña que ometepe ofrece.",
                        58000),
                    CardImageProfile(
                        "assets/img/peña.jpg",
                        "Jinotega",
                        "Descubre todo lo que Jinotega tiene por ofrecer.",
                        678504),
                    CardImageProfile("assets/img/san.jpg", "San Juan del Sur",
                        "Arena, mar y sabor Nicaraguense.", 10000),
                    CardImageProfile("assets/img/rio.jpg", "Rio San Juan",
                        "Rio San Juan 100% Nicaraguense!.", 58000),
                  ],
                ),
              )
            ],
          ),
        ],
      );
    }
  }
}
