import 'package:flutter_library/base/base_vm.dart';
import 'package:untitled_folder/pages/setting/setting_screen.dart';

import '../find_job/find_job_screen.dart';
import '../home/home_screen.dart';

class BottomNavigatorViewModel extends BaseVM {
  final list = [
    HomeScreen(),
    FindJobScreen(),
    const SettingScreen(),
  ];
  int selectIndex = 0;

  @override
  void onInit() {}

  void setPageIndex(int value) {
    selectIndex = value;
    notifyListeners();
  }
}
