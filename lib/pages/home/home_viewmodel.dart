import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/base/common_list/common_action.dart';
import 'package:untitled_folder/model/drawer.dart';
import 'package:untitled_folder/model/job.dart';

import '../../model/career.dart';

class HomeViewModel extends BaseVM{
  final ActionDrawable actionDrawable = ActionDrawable();
  final ActionCareer actionCareer = ActionCareer();
  final ActionJob actionJob = ActionJob();


  final listDrawable = [
    DrawerData(Icons.account_circle_rounded, DrawerType.PROFILE, "Profile"),
    DrawerData(Icons.save, DrawerType.JOB_STORAGE, "Job Storage"),
    DrawerData(Icons.app_registration, DrawerType.JOB_APPLY, "Job Apply"),
    DrawerData(Icons.logout, DrawerType.LOGOUT, "Logout"),
  ];

  final listCareer = [
    Career(0,"Mobile","https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Career(0,"Java","https://w7.pngwing.com/pngs/592/145/png-transparent-java-programming-language-programmer-computer-programming-logo-others-text-computer-program-programming-language.png"),
    Career(0,"Web","https://w7.pngwing.com/pngs/428/279/png-transparent-computer-icons-web-page-identity-angle-text-logo-thumbnail.png"),
    Career(0,"Python","https://www.pngfind.com/pngs/m/62-626208_python-logo-png-transparent-background-python-logo-png.png"),
    Career(0,"Designed","https://www.logodesign.net/logo/letter-d-inside-polygon-4839ld.png"),
    Career(0,"Test","https://w7.pngwing.com/pngs/192/840/png-transparent-beta-tester-software-testing-beta-verzia-computer-programming-computer-software-arc-miscellaneous-text-trademark-thumbnail.png"),
  ];

  static const String _des = "Clear Academy system and mentoring program to help you develop your career within Netcompany \n"
      "Performance appraisal twice a year to guarantee constructive feedback \n"
      "Professional Scandinavian working environment that values innovation, creativity and new ideas along...";

  final listRecommendedByCareer = [
    Job("Mobile", 15000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Java", 25000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Web", 25000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Python", 15000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Designed", 10000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Test", 5000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png")
  ];

  final listRecommendedByRegion = [
    Job("Mobile", 15000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Java", 25000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Web", 25000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Python", 15000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Designed", 10000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Job("Test", 5000000, _des,"https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png")
  ];

  @override
  void onInit() {
  }

}

class ActionDrawable extends CommonAction<DrawerData>{
  @override
  void onClickListener(DrawerData data) {
    super.onClickListener(data);
  }
}

class ActionCareer extends CommonAction<Career>{
  @override
  void onClickListener(Career data) {
    super.onClickListener(data);
  }
}

class ActionJob extends CommonAction<Job>{
  @override
  void onClickListener(Job data) {
    super.onClickListener(data);
  }
}

