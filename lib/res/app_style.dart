import 'package:flutter/material.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/main.dart';
import 'package:untitled_folder/res/app_color.dart';

class AppStyle{
  static TextStyle? get medium => Theme.of(globalKey.currentContext!).textTheme.displayMedium;

  static TextStyle? get small => Theme.of(globalKey.currentContext!).textTheme.bodySmall;

  static TextStyle? get title => Theme.of(globalKey.currentContext!).textTheme.titleLarge;

  static InputDecoration textFielInputDecoration(String hintText){
    return InputDecoration(
      labelText: hintText,
      labelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: AppSP.sp_14),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: AppColor.backgroundcolor,
          width: 2,
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
  }
}