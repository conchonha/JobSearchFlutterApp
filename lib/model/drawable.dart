import 'package:flutter/material.dart';
import 'package:flutter_library/base/common_list/common_data.dart';

class DrawableData extends CommonData{
  IconData iconData;
  DrawableType drawableType;
  String title;

  DrawableData(this.iconData,this.drawableType,this.title);
}

enum DrawableType{
  PROFILE
}