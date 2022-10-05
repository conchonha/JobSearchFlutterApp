import 'package:flutter/material.dart';
import 'package:flutter_library/base/common_list/common_data.dart';

class DrawerData extends CommonData {
  IconData iconData;
  DrawerType drawableType;
  String title;
  DataType dataType;

  DrawerData(this.iconData, this.drawableType, this.title,
      {this.dataType = DataType.TYPE_LIST_ARROW_PREVIEW})
      : super(dataType: dataType);
}

enum DrawerType {
  PROFILE,
  JOB_STORAGE,
  JOB_APPLY,
  LOGOUT,
  Line,
  TYPE_LESS_10TR,
  TYPE_10_20TR,
  TYPE_BIGGER_20TR,
  TYPE_BAC,
  TYPE_TRUNG,
  TYPE_NAM,
  TYPE_GOOD,
  TYPE_BASIC,
  TYPE_NOT_REQUIRED,
  TYPE_NORMAL
}
