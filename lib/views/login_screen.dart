import 'package:flutter/material.dart';
import 'package:medbo/router.dart';
import 'package:medbo/utils/app_colors.dart';
import 'package:medbo/utils/app_dimen.dart';
import 'package:medbo/utils/appview_helper.dart';
import 'package:medbo/utils/sharedPreference.dart';
import 'package:medbo/widgets/customButton.dart';
import 'package:medbo/widgets/customTextfield.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _controllerPassword, _controllerUserName;
  FocusNode _nodePassword, _nodeUserUsername;

  @override
  void initState() {
    _nodePassword = FocusNode();
    _nodeUserUsername = FocusNode();
    _controllerUserName = TextEditingController();
    _controllerPassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: hDimen(20),
          right: hDimen(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            vSpacing(hDimen(50)),
            Center(
              child: Container(
                height: hDimen(200),
                child: Image.asset(
                  "assets/icons/medbo-home-banner.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            vSpacing(hDimen(20)),
            Text(
              "Welcome back!",
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: hDimen(25),
                fontWeight: FontWeight.bold,
                fontFamily: "Avenir",
              ),
            ),
            vSpacing(hDimen(10)),
            Text(
              "Medbo (Care close to you)",
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: hDimen(17),
                fontFamily: "Avenir",
              ),
            ),
            vSpacing(hDimen(25)),
            CustomTextFieldWidget(
              elevation: 2,
              hintText: "Username",
              focusNode: _nodeUserUsername,
              controller: _controllerUserName,
              inputType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              selectedColor: AppColor.colorPrimary,
              onSubmitted: (value) {
                _nodeUserUsername.unfocus();
                _nodePassword.requestFocus();
              },
              textChangeValidator: (String value) {
                // return value.isValidEmail();
              },
            ),
            vSpacing(hDimen(30)),
            CustomTextFieldWidget(
              elevation: 2,
              hintText: "Password",
              obscureText: true,
              focusNode: _nodePassword,
              controller: _controllerPassword,
              inputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              selectedColor: AppColor.colorPrimary,
              onSubmitted: (value) {
                _nodePassword.unfocus();
              },
              textChangeValidator: (String value) {
                // return value.isValidPassword();
              },
            ),
            vSpacing(hDimen(5)),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Forgot Password ?",
                style: TextStyle(
                  color: AppColor.colorButtonLogIn,
                  fontSize: hDimen(15),
                  fontFamily: "Avenir",
                ),
              ),
            ),
            vSpacing(hDimen(25)),
            CustomButton(
              onClick: () {
                SharedPreference.saveBoolPreference(
                  "loggedin",
                  true,
                );
                Navigator.of(context)
                    .pushReplacementNamed(MedboRouter.ROUTE_SETTINGS_SCREEN);
              },
              elevation: 2,
              buttonColor: AppColor.colorButtonLogIn,
              buttonText: "LOGIN",
              width: hDimen(250),
              height: hDimen(50),
            ),
            vSpacing(hDimen(15)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  elevation: 2,
                  buttonColor: AppColor.colorGlogin,
                  buttonText: "G Login",
                  width: hDimen(150),
                  height: hDimen(45),
                ),
                hSpacing(hDimen(20)),
                CustomButton(
                  elevation: 2,
                  buttonColor: AppColor.colorFlogin,
                  buttonText: "F login",
                  width: hDimen(150),
                  height: hDimen(45),
                ),
              ],
            ),
            vSpacing(25),
            Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: hDimen(15),
                fontFamily: "Avenir",
              ),
            ),
            vSpacing(15),
            Text(
              "Sign up",
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: hDimen(18),
                fontWeight: FontWeight.bold,
                fontFamily: "Avenir",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
