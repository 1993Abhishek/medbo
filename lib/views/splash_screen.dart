import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/router.dart';
import 'package:medbo/utils/app_colors.dart';
import 'package:medbo/utils/app_dimen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  double _height = hDimen(50), _width = hDimen(50);
  double opacityInit=0.0;

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        for (double i = hDimen(50); i < hDimen(300); i++) {
          _height = i;
          _width = i;
          print(_height);
        }
        for(double j=0 ; j<1.0;j+=0.2)
        {
          opacityInit=j;
        }
      });
    });

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        MedboRouter.ROUTE_LOGIN_SCREEN,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(seconds: 3),
        opacity: opacityInit,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.white,
                AppColor.colorSplashSCreen,
              ],
            ),
          ),
          child: Center(
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    "assets/icons/logo.png",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
