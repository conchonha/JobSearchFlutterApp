import 'package:flutter/material.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:flutter_library/utils/navigator_services.dart';
import 'package:untitled_folder/res/app_color.dart';

class AppStyle{
  static TextStyle? get medium => Theme.of(globalKey.getCurrentContext).textTheme.displayMedium;

  static TextStyle? get small => Theme.of(globalKey.getCurrentContext).textTheme.bodySmall;

  static TextStyle? get title => Theme.of(globalKey.getCurrentContext).textTheme.titleLarge;

  static InputDecoration textFielInputDecoration(String hintText){
    return InputDecoration(
      labelText: hintText,
      errorStyle: const TextStyle(fontSize: 5),
      errorMaxLines: 1,
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

  static InputDecoration textFielSearch(){
    return const InputDecoration(
      labelStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: AppSP.sp_14),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: AppColor.backgroundcolor,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
  }
}