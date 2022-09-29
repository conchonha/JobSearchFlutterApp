import 'package:flutter/material.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:flutter_library/utils/navigator_services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:untitled_folder/pages/introduce_page/introduce_page.dart';
import 'package:untitled_folder/res/app_color.dart';
import 'package:untitled_folder/res/app_fonts.dart';
import 'package:untitled_folder/utils/routers.dart' as router;


GlobalKey<NavigatorState> globalKey = GlobalKey();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final NavigatorServices navigator = NavigatorServices();

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigator.globalKey ??= globalKey,
        theme: _themeData,
        home: const _HomePage(),
        onGenerateRoute: router.routeSetting,
      ),
    );
  }

  ThemeData get _themeData => ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColor.hFFFFFF,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        displayMedium: TextStyle(
            color: Colors.black,
            fontSize: AppSP.sp_12,
            fontFamily: AppFont.fontMulish,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: Colors.black,
            fontSize: AppSP.sp_14,
            fontFamily: AppFont.fontMulish,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),
        titleLarge: TextStyle(
          fontSize: AppSP.sp_16,
          fontFamily: AppFont.fontMulish,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
        ),
      ));
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: IntroduceScreen(),
      ),
    );
  }
}
