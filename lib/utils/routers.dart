import 'package:flutter/material.dart';
import 'package:untitled_folder/pages/auth/login_screen.dart';
import 'package:untitled_folder/pages/auth/register_screen.dart';

class RouterName {
  static const String introduce_screen = '/introduce_screen';
  static const String login_screen = '/login_screen';
  static const String bottom_navigator_screen = '/bottom_navigator_screen';
  static const String signup_screen = '/signup_screen';
}

Route<dynamic>? routeSetting(RouteSettings settings) {
  switch (settings.name) {
    case RouterName.login_screen:
      return MaterialPageRoute(builder: (_) => const LogInScreen());
    case RouterName.signup_screen:
      return MaterialPageRoute(builder: (_) => const Register());
  }
  throw ("Not found route name, please check again");
}
