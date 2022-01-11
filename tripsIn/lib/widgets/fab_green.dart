// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  const FloatingActionButtonGreen({Key? key}) : super(key: key);

  @override
  _FloatingActionButtonGreenState createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool _pressed = false;

  void onPressedFav() {
    setState(() {
      _pressed = !this._pressed;

      Scaffold.of(context).hideCurrentSnackBar();

      if (this._pressed == true) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Agregado a Favoritos")));
      } else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Eliminado de Favoritos")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Me Gusta",
      child: Icon(this._pressed ? Icons.favorite : Icons.favorite_border),
      onPressed: onPressedFav,
    );
  }
}
