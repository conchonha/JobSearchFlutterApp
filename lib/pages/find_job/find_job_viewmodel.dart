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
import 'package:oktoast/oktoast.dart';

class FindJobViewModel extends BaseVM{
  final _api = locator<Api>().client;
  final _dataProvide = DataProvider();
  final ActionJob actionJob = ActionJob();
  final ActionDrawable actionDrawable = ActionDrawable();
  final List<Job> listSearch = [];
  bool check = false;

  final listDrawable = [
    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"Trình Độ Tiếng Anh",dataType: DataType.TYPE_LIST_ARROW),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_GOOD,"Tốt"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_BASIC,"Cơ Bản"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_NOT_REQUIRED,"Không Yêu Cầu"),

    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"Lương",dataType: DataType.TYPE_LIST_ARROW),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_LESS_10TR,"Nhỏ Hơn 10.000.000"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_10_20TR,"10.000.000 - 20.000.000"),
    DrawerData(Icons.navigate_next,DrawerType.TYPE_BIGGER_20TR,"Lớn Hơn 20.000.000"),

    DrawerData(Icons.account_circle_rounded,DrawerType.TYPE_NORMAL,"Khu Vực",dataType: DataType.TYPE_LIST_ARROW),
  ];

  @override
  void onInit() {
    addStreamListener<List<Area>>(_dataProvide.listAreaStream, (p0){
      p0.forEach((element) {
        listDrawable.add(DrawerData(Icons.navigate_next,DrawerType.TYPE_AREA,element.name,id: element.id));
      });
      notifyListeners();
    });

    List<Job>? listTmp;
    dynamic funcTmp;
    actionDrawable.callback = (drawable){
      if(listSearch.isNotEmpty){
        check = true;
      }

      switch(drawable.drawableType){
        case DrawerType.TYPE_AREA:
           listTmp = listSearch.where((e) => e.areaId == drawable.id).toList();
           funcTmp = _api.getListRecommendedByArea(drawable.id);
          break;
        case DrawerType.TYPE_LESS_10TR:
          listTmp = listSearch.where((e) => e.price < 10000000).toList();
          funcTmp = _api.getListJobLess10tr();
          break;
        case DrawerType.TYPE_10_20TR:
          listTmp = listSearch.where((e) => e.price > 10000000 && e.price < 20000000).toList();
          funcTmp = _api.getListJobBetter10tr_20tr();
          break;
        case DrawerType.TYPE_BIGGER_20TR:
          listTmp = listSearch.where((e) => e.price > 20000000).toList();
          funcTmp = _api.getListJobBigger20tr();
          break;
        case DrawerType.TYPE_NOT_REQUIRED:
          listTmp = listSearch.where((e) => e.englishLevel == 1).toList();
          funcTmp = _api.getListJobFromEnglishLevelId(1);
          break;
        case DrawerType.TYPE_BASIC:
          listTmp = listSearch.where((e) => e.englishLevel == 2).toList();
          funcTmp = _api.getListJobFromEnglishLevelId(2);
          break;
        case DrawerType.TYPE_GOOD:
          listTmp = listSearch.where((e) => e.englishLevel == 3).toList();
          funcTmp = _api.getListJobFromEnglishLevelId(3);
          break;
        default:
          listTmp = null;
          // showError("Not found function name: ${drawable.title}");
          break;
      }

      if(listTmp?.isNotEmpty == true){
        listSearch.clear();
        listSearch.addAll(listTmp!);
        notifyListeners();
        return;
      }
      if(check){
        showToast("Không tìm thấy kết quả phù hợp");
        return;
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
    },closeLoading: false);
  }
}