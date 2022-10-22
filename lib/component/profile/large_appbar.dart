import 'package:flutter/material.dart';

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
    backgroundColor: Colors.white,
    elevation: 1,
    brightness: Brightness.light,
    leading: childLeading ?? Container(),
     titleSpacing: check == 0.0 ? 0.0 : 0,
     title: check == null ? Text(
       title,
       style: const TextStyle(
         color: Colors.black,
         fontSize: 17,
         fontWeight: FontWeight.w500,
       ),
     ) : newTitle,
    actions: [childActions ?? Container()],
  );
}
