import 'package:flutter/material.dart';
import 'package:untitled_folder/res/app_color.dart';
import 'package:untitled_folder/res/app_style.dart';

InputDecoration textFielInputDecoration(String hintText){
  return InputDecoration(
    labelText: hintText,
    labelStyle: AppStyle.small,
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


AppBar appBarMain(String title){
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColor.backgroundcolor,
    title: Text(
      title,
      style: AppStyle.title?.copyWith(color: Colors.white),
    ),
  );
}