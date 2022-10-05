import 'package:flutter_library/base/common_list/common_data.dart';

class Job extends CommonData{
  String title;
  double price;
  String description;
  String icon;

  Job(this.title, this.price, this.description,this.icon);
}