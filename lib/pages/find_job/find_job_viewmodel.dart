import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/base/common_list/common_data.dart';
import 'package:untitled_folder/model/area/area.dart';
import 'package:untitled_folder/model/data/data_provider.dart';
import 'package:untitled_folder/model/response/home/response_data.dart';
import 'package:untitled_folder/services/api_services.dart';
import 'package:untitled_folder/utils/locator_getit.dart';

import '../../model/drawer.dart';
import '../../model/job/job.dart';
import '../home/home_viewmodel.dart';

class FindJobViewModel extends BaseVM{
  final _api = locator<Api>().client;
  final _dataProvide = DataProvider();
  final ActionJob actionJob = ActionJob();
  final ActionDrawable actionDrawable = ActionDrawable();

  final List<Job> listSearch = [];

  final listDrawable = [
    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"English Level",dataType: DataType.TYPE_LIST_ARROW),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_GOOD,"Good"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_BASIC,"Basic"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_NOT_REQUIRED,"Not Required"),

    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"Salary",dataType: DataType.TYPE_LIST_ARROW),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_GOOD,"Less 10.000.000"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_BASIC,"10.000.000 - 20.000.000"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_NOT_REQUIRED,"Bigger 20.000.000"),

    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"Area Zoning",dataType: DataType.TYPE_LIST_ARROW),
  ];

  @override
  void onInit() {
    addStreamListener<List<Area>>(_dataProvide.listAreaStream, (p0){
      p0.forEach((element) {
        listDrawable.add(DrawerData(Icons.navigate_next,DrawerType.TYPE_AREA,element.name,id: element.id));
      });
      notifyListeners();
    });

    actionDrawable.callback = (drawable){
      dynamic funcTmp;

      switch(drawable.drawableType){
        case DrawerType.TYPE_AREA:
          funcTmp = _api.getListRecommendedByArea(drawable.id);
          break;
        case DrawerType.TYPE_LESS_10TR:
          funcTmp = _api.getListJobLess10tr();
          break;
        case DrawerType.TYPE_10_20TR:
          funcTmp = _api.getListJobBetter10tr_20tr();
          break;
        case DrawerType.TYPE_BIGGER_20TR:
          funcTmp = _api.getListJobBigger20tr();
          break;
        case DrawerType.TYPE_NOT_REQUIRED:
          funcTmp = _api.getListJobFromEnglishLevelId(1);
          break;
        case DrawerType.TYPE_BASIC:
          funcTmp = _api.getListJobFromEnglishLevelId(2);
          break;
        case DrawerType.TYPE_GOOD:
          funcTmp = _api.getListJobFromEnglishLevelId(3);
          break;
        default:
          showError("Not found function name: ${drawable.title}");
          break;
      }

      callApi<ResponseData<Job>>(funcTmp, (p0){
        listSearch.clear();
        listSearch.addAll(p0.data);
        notifyListeners();
      });
    };
  }

  void onTextChange(String value) {
    callApi<ResponseData<Job>>(_api.getListFromSearch(value), (p0){
      listSearch.clear();
      listSearch.addAll(p0.data);
      notifyListeners();
    });
  }
}