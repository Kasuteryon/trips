// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:trips/Place/ui/screens/home.dart';
import 'package:trips/Place/ui/screens/search.dart';
import 'package:trips/User/ui/screens/profile.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearcTrips(),
    ProfileTrips()
  ];

  void onTapTapped(int index) {
    setState(() => indexTap = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      extendBody: true,

      // bottomNavigationBar: SalomonBottomBar(
      //   currentIndex: indexTap,
      //   onTap: onTapTapped,
      //   margin: EdgeInsets.all(15.0),
      //   items: [
      //     /// Home
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text("Inicio"),
      //       selectedColor: Colors.blue,
      //     ),

      //     /// Search
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.search),
      //       title: Text("Buscar"),
      //       selectedColor: Colors.teal,
      //     ),

      //     /// Profile
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text("Perfil"),
      //       selectedColor: Colors.orange,
      //     ),
      //   ],
      // ),

      // bottomNavigationBar: Theme(
      //     data: Theme.of(context)
      //         .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
      //     child: BottomNavigationBar(
      //       onTap: onTapTapped,
      //       currentIndex: indexTap,
      //       items: [
      //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.search), label: 'Buscar'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.person), label: 'Perfil'),
      //       ],
      //     )
      // ),

      // DOT FLOATING NAVIGATION
      bottomNavigationBar: DotNavigationBar(
        currentIndex: indexTap,
        onTap: onTapTapped,
        enableFloatingNavBar: true,
        marginR: EdgeInsets.only(right: 25.0, left: 25.0, bottom: 25.0),
        borderRadius: 20.0,
        boxShadow: [
          BoxShadow(
            color: Color(0XFF7090B0),
            spreadRadius: 0.10,
            blurRadius: 15.0,
            offset: Offset(0.0, 5.5),
          )
        ],
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.blue,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.search),
            selectedColor: Colors.teal,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
