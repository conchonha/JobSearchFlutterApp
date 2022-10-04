import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/base/common_list/common_action.dart';
import 'package:untitled_folder/model/drawable.dart';

import '../../model/career.dart';

class HomeViewModel extends BaseVM{
  final ActionDrawable actionDrawable = ActionDrawable();
  final ActionCareer actionCareer = ActionCareer();


  final listDrawable = [
    DrawableData(Icons.account_circle_rounded, DrawableType.PROFILE, "Profile"),
    DrawableData(Icons.save, DrawableType.PROFILE, "Job Storage"),
    DrawableData(Icons.app_registration, DrawableType.PROFILE, "Job Apply"),
    DrawableData(Icons.logout, DrawableType.PROFILE, "Logout"),
  ];

  final listCareer = [
    Career(0,"Mobile","https://www.clipartmax.com/png/middle/178-1788500_mobile-app-development-mobile-phone-round-logo.png"),
    Career(0,"Java","https://w7.pngwing.com/pngs/592/145/png-transparent-java-programming-language-programmer-computer-programming-logo-others-text-computer-program-programming-language.png"),
    Career(0,"Web","https://w7.pngwing.com/pngs/428/279/png-transparent-computer-icons-web-page-identity-angle-text-logo-thumbnail.png"),
    Career(0,"Python","https://www.pngfind.com/pngs/m/62-626208_python-logo-png-transparent-background-python-logo-png.png"),
    Career(0,"Designed","https://www.logodesign.net/logo/letter-d-inside-polygon-4839ld.png"),
    Career(0,"Test","https://www.logodesign.net/logo/letter-d-inside-polygon-4839ld.png"),

  ];

  @override
  void onInit() {
  }

}

class ActionDrawable extends CommonAction<DrawableData>{
  @override
  void onClickListener(DrawableData data) {
    super.onClickListener(data);
  }
}

class ActionCareer extends CommonAction<Career>{
  @override
  void onClickListener(Career data) {
    super.onClickListener(data);
  }
}