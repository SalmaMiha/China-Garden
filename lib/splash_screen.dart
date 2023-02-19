import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 3000),(){});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder:(context)=>NaviBottom()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image(image: AssetImage('image/logo.jpg'),),
        ),
        color: Colors.black,
      ),
    );
  }
}