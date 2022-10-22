import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/base/common_list/common_action.dart';
import 'package:untitled_folder/model/drawer.dart';
import 'package:untitled_folder/model/job.dart';

import '../../model/career/career.dart';
import '../../model/data/data_provider.dart';
import '../../model/response/home/response_data.dart';
import '../../services/api_services.dart';
import '../../utils/locator_getit.dart';

class HomeViewModel extends BaseVM{
  final _api = locator<Api>();
  final _dataProvider = DataProvider();

  final ActionDrawable actionDrawable = ActionDrawable();
  final ActionCareer actionCareer = ActionCareer();
  final ActionJob actionJob = ActionJob();

  final List<Career> listCareer = [];

  final listDrawable = [
    DrawerData(Icons.account_circle_rounded, DrawerType.PROFILE, "Profile"),
    DrawerData(Icons.save, DrawerType.JOB_STORAGE, "Job Storage"),
    DrawerData(Icons.app_registration, DrawerType.JOB_APPLY, "Job Apply"),
    DrawerData(Icons.logout, DrawerType.LOGOUT, "Logout"),
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
    callApi<ResponseData<Career>>(_api.client.getListCareer(), (value){
      listCareer.clear();
      listCareer.addAll(value.data);
      _dataProvider.setListCareer(value.data);
      notifyListeners();
    });
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

