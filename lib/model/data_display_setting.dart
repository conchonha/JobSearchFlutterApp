import 'package:flutter/cupertino.dart';

class DataDisplaySetting {
  Color color;
  IconData iconData;
  String title;
  TypeSetting type;

  DataDisplaySetting(this.color, this.iconData, this.title, this.type);
}

enum TypeSetting { PROFILE, JOB_APPLY, JOB_SAVE, WEB_REFERENCES, LOGOUT }