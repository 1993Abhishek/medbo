

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medbo/utils/route_animation.dart';
import 'package:medbo/views/login_screen.dart';
import 'package:medbo/views/settings.dart';
import 'package:medbo/views/splash_screen.dart';

class MedboRouter {
  static const String ROUTE_INITIAL = "/";
  static const String ROUTE_LOGIN_SCREEN = "login-screen";
  static const String ROUTE_SETTINGS_SCREEN="settings-screen";


  static String ROUTE_CURRENT = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    ROUTE_CURRENT = settings.name;
    Widget currentWidget;

    switch (settings.name) {
      case ROUTE_INITIAL:
        currentWidget = SplashScreen();
        break;

      case ROUTE_LOGIN_SCREEN:
        currentWidget = LogInScreen();
        break;
      case ROUTE_SETTINGS_SCREEN:
        currentWidget = SettingsPage();
        break;
      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }

    return FadeRoute(page: currentWidget, settings: settings);
  }
}
