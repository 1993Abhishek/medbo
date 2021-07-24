import 'package:flutter/material.dart';
import 'package:medbo/utils/app_dimen.dart';
import 'package:medbo/utils/appview_helper.dart';
import 'package:medbo/utils/sharedPreference.dart';
import 'package:medbo/widgets/customButton.dart';
import 'package:medbo/widgets/customDrawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLoggedIn=false;
  @override
  void initState() {
    // TODO: implement initState
    getPreference();
    super.initState();
  }
  getPreference()async{
    bool isLogged= await SharedPreference.getBoolPreference("loggedin");
    setState(() {
     isLoggedIn=isLogged;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          hDimen(60),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF1d507d),
                Color(0xFF1c7595),
              ])),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF1d507d),
            title: Text(
              "SETTING",
              style: TextStyle(
                color: Colors.white,
                fontSize: hDimen(20),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          vSpacing(hDimen(20)),
          Image.asset("assets/icons/medbo-home-banner.png"),
          vSpacing(hDimen(20)),
          CustomButton(
            width: hDimen(270),
            height: hDimen(45),
            elevation: 2,
            buttonText: "PROFILE",
            buttonColor: Color(0xFF84c0f6),
          ),
          vSpacing(hDimen(15)),
          CustomButton(
            width: hDimen(270),
            height: hDimen(45),
            elevation: 2,
            buttonText: "BOOKING",
            buttonColor: Color(0xFF84c0f6),
          ),
          vSpacing(hDimen(15)),
          CustomButton(
            width: hDimen(270),
            height: hDimen(45),
            elevation: 2,
            buttonText: "CUSTOMER SERVICE",
            buttonColor: Color(0xFF84c0f6),
          ),
          vSpacing(hDimen(15)),
          !isLoggedIn ? CustomButton(
            width: hDimen(270),
            height: hDimen(45),
            elevation: 2,
            buttonText: "LOGIN",
            buttonColor: Color(0xFF84c0f6),
          ):Container(),
        ],
      ),
    );
  }
}
