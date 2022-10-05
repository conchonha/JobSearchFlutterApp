import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/base/common_list/common_data.dart';

import '../../model/drawer.dart';
import '../../model/job.dart';
import '../home/home_viewmodel.dart';

class FindJobViewModel extends BaseVM{
  final ActionJob actionJob = ActionJob();
  final ActionDrawable actionDrawable = ActionDrawable();

  static const String _des = "Clear Academy system and mentoring program to help you develop your career within Netcompany \n"
      "Performance appraisal twice a year to guarantee constructive feedback \n"
      "Professional Scandinavian working environment that values innovation, creativity and new ideas along...";

  final listSearch = [
    Job("Mobile", 15000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Java", 25000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Web", 25000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Python", 15000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Designed", 10000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Test", 5000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png")
  ];

  final listDrawable = [
    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"Area Zoning",dataType: DataType.TYPE_LIST_ARROW),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_BAC,"Mien Bac"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_TRUNG,"Mien Trung"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_NAM,"Mien Nam"),

    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"English Level",dataType: DataType.TYPE_LIST_ARROW),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_GOOD,"Good"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_BASIC,"Basic"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_NOT_REQUIRED,"Not Required"),

    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"Salary",dataType: DataType.TYPE_LIST_ARROW),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_GOOD,"Less 10.000.000"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_BASIC,"10.000.000 - 20.000.000"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_NOT_REQUIRED,"Bigger 20.000.000"),
  ];

  @override
  void onInit() {
  }
}