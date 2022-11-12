import 'package:flutter/material.dart';
import 'package:untitled_folder/component/settings/webview.dart';
import 'package:untitled_folder/model/job/job.dart';
import 'package:untitled_folder/pages/auth/login_screen.dart';
import 'package:untitled_folder/pages/auth/register_screen.dart';
import 'package:untitled_folder/pages/detail_job/detail_job_screen.dart';
import 'package:untitled_folder/pages/profile/profile_screen.dart';
import 'package:untitled_folder/res/contains.dart';

import '../pages/bottom_navigate/bottom_navigate_screen.dart';
import '../pages/job_storage_or_apply/job_storage_or_apply_screen.dart';

class RouterName {
  static const String login_screen = '/login_screen';
  static const String bottom_navigator_screen = '/bottom_navigator_screen';
  static const String signup_screen = '/signup_screen';
  static const profile_screen = '/profile_screen';
  static const detail_job_screen = '/detail_job_screen';
  static const job_save_or_apply_screen = '/job_save_or_apply_screen';
  static const WEBVIEW_CLIENT_SCREEN = '/WEBVIEW_CLIENT_SCREEN';
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
    case RouterName.detail_job_screen:
      final agr = settings.arguments as Job;
      return _navigate(DetailJobScreen(agr));
    case RouterName.job_save_or_apply_screen:
      final agr = settings.arguments as Map<String,dynamic>;
      return _navigate(JobStorageOrApplyScreen(jobItemType: agr[Constants.KEY_JOB_ITEM_TYPE],id: agr[Constants.KEY_ID],));
    case RouterName.WEBVIEW_CLIENT_SCREEN:
      return _navigate(const WebViewClient());
  }
  throw ("Not found route name, please check again");
}

MaterialPageRoute _navigate(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
