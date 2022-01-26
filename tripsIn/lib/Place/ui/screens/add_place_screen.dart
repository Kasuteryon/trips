// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trips/Place/ui/widgets/card_image.dart';
import 'package:trips/Place/ui/widgets/location_input.dart';
import 'package:trips/widgets/button.dart';
import 'package:trips/widgets/gradient_back.dart';
import 'package:trips/widgets/text_input.dart';
import 'package:trips/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({required this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(title: "Añadir nuevo lugar:", altura: 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0),
                  child: TitleHeader(
                    title: "Añadir lugar ",
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: [
                // Widget foto
                Container(
                  margin:
                      EdgeInsets.only(bottom: 30.0, right: 20.0, left: 20.0),
                  alignment: Alignment.center,
                  child: CardImage(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_enhance_rounded,
                    width: 400.0,
                    height: 250.0,
                    left: 0.0,
                    onPressed: () {},
                  ),
                ),

                // Textfield de Título
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: "Digita título",
                    inputType: TextInputType.name,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: "Digita descripción",
                  inputType: TextInputType.multiline,
                  maxLines: 6,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: LocationInput(
                    hintText: "Ingresa ubicación",
                    iconData: Icons.location_on_outlined,
                    controller: TextEditingController(),
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Agregar lugar",
                    onPressed: () {
                      
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
