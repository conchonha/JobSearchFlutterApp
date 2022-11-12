import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:untitled_folder/model/response/home/response_data.dart';
import 'package:untitled_folder/pages/job_storage_or_apply/job_storage_or_apply_screen.dart';
import 'package:untitled_folder/services/api_services.dart';
import 'package:untitled_folder/utils/db_utils.dart';

import '../../model/job/job.dart';
import '../../utils/locator_getit.dart';
import '../home/home_viewmodel.dart';

class JobStorageOrApplyViewModel extends BaseVM {
  final _api = locator<Api>();

  final ActionJob actionJob = ActionJob();
  final _database = locator<DatabaseUtils>();
  final List<Job> listJob = [];
   JobItemType? _jobItemType = null;
   int? _id = null;

  @override
  void onInit() {
    actionJob.callback = (){
      listJob.clear();
      loadList(_jobItemType,_id);
    };
  }

  void backScreen() {
    navigator.pop();
  }

  void loadList(JobItemType? jobItemType, int? id) {
    debugPrint("loadList jobItemType: $jobItemType --- id: $id");
    _jobItemType = jobItemType;
    _id = id;

    dynamic fucTmp;
    switch (jobItemType) {
      case JobItemType.TYPE_APPLY:
        fucTmp = _database.getDb().jobDao.getListJobApply(true);
        break;
      case JobItemType.TYPE_STORAGE:
        fucTmp = _database.getDb().jobDao.getListJobSave(true);
        break;
      default:
        fucTmp = _api.client.getListRecommendedByCareer(id);
        break;
    }

    if(jobItemType == JobItemType.TYPE_OTHER){
      callApi<ResponseData<Job>>(fucTmp, (p0) {
        listJob.addAll(p0.data);
        notifyListeners();
      });
      return;
    }

    callApi<List<Job>>(fucTmp, (p0) {
      listJob.addAll(p0);
      notifyListeners();
    });
  }
}
