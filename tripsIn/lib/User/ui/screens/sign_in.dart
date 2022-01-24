// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/trips.dart';
import 'package:trips/widgets/button_green.dart';
import 'package:trips/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc!.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //
        if (!snapshot.hasData || snapshot.hasError || snapshot == null) {
          return signInGoogleUi();
        } else {
          return Trips();
        }
      },
    );
  }

  Widget signInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", double.infinity),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30.0, left: 30.0, bottom: 20.0),
                child: Text(
                  "¡Bienvenidos \n a su aplicación de viajes!",
                  style: TextStyle(
                      fontFamily: "Epilogue",
                      fontSize: 37.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ButtonGreen(
                  buttonText: "Iniciar con Google",
                  onPressed: () {
                    userBloc!.signIn().then((UserCredential user) {
                      print("................");
                      print(
                          "El usuario es ${user.additionalUserInfo?.profile}");
                    });
                  },
                  height: 60.0,
                  width: 300.0)
            ],
          )
        ],
      ),
    );
  }
}
