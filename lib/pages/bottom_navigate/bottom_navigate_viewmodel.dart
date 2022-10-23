import 'package:flutter_library/base/base_vm.dart';

import '../find_job/find_job_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class BottomNavigatorViewModel extends BaseVM {
  final list = [
    HomeScreen(),
    FindJobScreen(),
    const MyProfileScreen(),
  ];
  int selectIndex = 0;

  @override
  void onInit() {}

  void setPageIndex(int value) {
    selectIndex = value;
    notifyListeners();
  }
}
