import 'package:flutter/material.dart';
import 'package:untitled_folder/pages/auth/login_screen.dart';
import 'package:untitled_folder/pages/auth/register_screen.dart';
import 'package:untitled_folder/pages/profile/profile_screen.dart';

import '../pages/bottom_navigate/bottom_navigate_screen.dart';

class RouterName {
  static const String login_screen = '/login_screen';
  static const String bottom_navigator_screen = '/bottom_navigator_screen';
  static const String signup_screen = '/signup_screen';
  static const profile_screen = '/profile_screen';
}

Route<dynamic>? routeSetting(RouteSettings settings) {
  switch (settings.name) {
    case RouterName.login_screen:
      return _navigate(const LogInScreen());
    case RouterName.signup_screen:
      return _navigate(const Register());
    case RouterName.bottom_navigator_screen:
      return _navigate(const BottomNavigatorLayout());
    case RouterName.profile_screen:
      return _navigate(const MyProfileScreen());
  }
  throw ("Not found route name, please check again");
}

MaterialPageRoute _navigate(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
