import 'package:flutter/material.dart';
import 'package:untitled_folder/res/app_color.dart';
import 'package:untitled_folder/res/app_style.dart';

AppBar largeAppbar({
  final bool? check,
  final Widget? childLeading,
  final title,
  final Widget? childActions,
  final double? titleSpacing,
  final Widget? newTitle, DefaultTabController? body, AppBar? appBar
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: check == null ? true : false,
    backgroundColor: AppColor.backgroundcolor,
    elevation: 1,
    brightness: Brightness.light,
    leading: childLeading ?? Container(),
     titleSpacing: check == 0.0 ? 0.0 : 0,
     title: check == null ? Text(
       title,
       style: AppStyle.title?.copyWith(color: AppColor.whiteColor),
     ) : newTitle,
    actions: [childActions ?? Container()],
  );
}
