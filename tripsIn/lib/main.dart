// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trips/trips.dart';
import 'package:trips/trips_cupertino.dart';

import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status ba
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trips',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Trips()

        //const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
