import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/base/common_list/common_action.dart';
import 'package:flutter_library/utils/shared_prefs.dart';
import 'package:untitled_folder/model/area/area.dart';
import 'package:untitled_folder/model/drawer.dart';
import 'package:untitled_folder/model/job/job.dart';
import 'package:untitled_folder/pages/job_storage_or_apply/job_storage_or_apply_screen.dart';
import 'package:untitled_folder/utils/routers.dart';

import '../../model/career/career.dart';
import '../../model/data/data_provider.dart';
import '../../model/response/home/response_data.dart';
import '../../model/user/user.dart';
import '../../res/contains.dart';
import '../../services/api_services.dart';
import '../../utils/db_utils.dart';
import '../../utils/locator_getit.dart';
import 'package:oktoast/oktoast.dart';

class HomeViewModel extends BaseVM {
  final _api = locator<Api>();
  final _dataProvider = DataProvider();

  final ActionDrawable actionDrawable = ActionDrawable();
  final ActionCareer actionCareer = ActionCareer();
  final ActionJob actionJob = ActionJob();
  final List<Career> listCareer = [];
  final List<Job> _listRecommendedByCareer = [];
  final List<Job> _listRecommendedByArea = [];

  User? userInFor;
  final listDrawable = [
    DrawerData(Icons.account_circle_rounded, DrawerType.PROFILE, "Hồ Sơ"),
    DrawerData(Icons.save, DrawerType.JOB_STORAGE, "Công Việc Đã Lưu"),
    DrawerData(Icons.app_registration, DrawerType.JOB_APPLY, "Công Việc Đã Ứng Tuyển"),
    DrawerData(Icons.logout, DrawerType.LOGOUT, "Đăng Xuất"),
  ];

  @override
  void onInit() {
    userInFor = sharedPrefs.getObject<User>(User.fromJson, Constants.KEY_USER);

    callApi<ResponseData<Career>>(_api.client.getListCareer(), (value) {
      listCareer.addAll(value.data);
      _dataProvider.setListCareer(value.data);
      notifyListeners();
    });

    callApi<ResponseData<Job>>(
        _api.client.getListRecommendedByCareer(sharedPrefs
                .getObject<Career>(
                    Career.fromJson, Constants.KEY_PROFILE_CAREER)
                ?.id ??
            1),
        (p0) {
          _listRecommendedByCareer.addAll(p0.data);
          notifyListeners();
        });

    callApi<ResponseData<Job>>(
        _api.client.getListRecommendedByArea(sharedPrefs
            .getObject<Area>(
            Area.fromJson, Constants.KEY_PROFILE_AREA)
            ?.id ??
            1),
            (p0) {
          _listRecommendedByArea.addAll(p0.data);
          notifyListeners();
        });

    callApi<ResponseData<Area>>(_api.client.getListArea(), (p0) {
      _dataProvider.setListArea(p0.data);
      notifyListeners();
    });
  }

  List<Job> getListRecommendedBy(bool checkRecommendedByCareer) => checkRecommendedByCareer
      ? _listRecommendedByCareer
      : _listRecommendedByArea;
}

class ActionDrawable extends CommonAction<DrawerData> {
  final _shaPrefs = SharedPrefs();
  Function(DrawerData)? callback;

  @override
  void onClickListener(DrawerData data) {
    super.onClickListener(data);
    switch (data.drawableType) {
      case DrawerType.PROFILE:
        navigator.pushName(RouterName.profile_screen);
        break;
      case DrawerType.JOB_STORAGE:
        navigator.pushName(RouterName.job_save_or_apply_screen,argument: {Constants.KEY_JOB_ITEM_TYPE : JobItemType.TYPE_STORAGE,Constants.KEY_ID : null});
        break;
      case DrawerType.JOB_APPLY:
        navigator.pushName(RouterName.job_save_or_apply_screen,argument: {Constants.KEY_JOB_ITEM_TYPE : JobItemType.TYPE_APPLY,Constants.KEY_ID : null});
        break;
      case DrawerType.LOGOUT:
        _shaPrefs.removeKey(Constants.KEY_USER);
        navigator.pushNameAndRemoveUtil(RouterName.login_screen, RouterName.login_screen);
        break;
    }
    callback?.call(data);
  }
}

class ActionCareer extends CommonAction<Career> {
  @override
  void onClickListener(Career data) {
    super.onClickListener(data);
    navigator.pushName(RouterName.job_save_or_apply_screen,argument: {Constants.KEY_JOB_ITEM_TYPE : JobItemType.TYPE_OTHER,Constants.KEY_ID : data.id});
  }
}

class ActionJob extends CommonAction<Job> {
  VoidCallback? callback;
  final _db = locator<DatabaseUtils>().getDb();

  @override
  void onClickListener(Job data) {
    super.onClickListener(data);
    navigator.pushName(RouterName.detail_job_screen,argument: data);
  }

  @override
  void onDelete(Job data) async{
    super.onDelete(data);
    await _db.jobDao.deleteItem(data);
    showToast("Xoá ${data.title} thành công");
    callback?.call();
  }
}
