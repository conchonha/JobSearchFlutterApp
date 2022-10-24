import 'package:flutter_library/base/base_vm.dart';
import 'package:untitled_folder/model/job/job.dart';
import 'package:untitled_folder/utils/extension.dart';
import 'package:untitled_folder/utils/locator_getit.dart';

import '../../model/area/area.dart';
import '../../model/data/data_provider.dart';
import '../../utils/db_utils.dart';
import 'package:oktoast/oktoast.dart';

class DetailJobViewModel extends BaseVM{
  final _dataProvider = DataProvider();
  final _database = locator<DatabaseUtils>();

  late Job job;
  final List<Map<String,dynamic>> listItemStart = [];
  final List<Map<String,dynamic>> listItemEnd = [];

  void setJob(Job value){
    job = value;
    listItemStart.addAll([
      {"Salary" : job.price},
      {"Amount" : job.amount},
      {"Age" : job.age},
      {"Gender" : job.gender == 0? "Nam" : "Nữ"},
    ]);

    listItemEnd.addAll([
      {"Area": ""},
      {"Experience" : job.experience},
      {"EnglishLevel" : job.englishLevel.convertEngListLevel},
      {"Other" : job.description}
    ]);
    notifyListeners();
  }

  @override
  void onInit() {
    addStreamListener<List<Area>>(_dataProvider.listAreaStream, (p0){
      p0.forEach((element) {
        if(job.englishLevel == element.id){
          listItemEnd.first["Area"] = element.name;
          notifyListeners();
        }
      });
    });
  }

  void saveJobLocal() async{
    job.applyJob = true;
    await _database.getDb().jobDao.insertItem(job);
    showToast("Save job success", position: ToastPosition.bottom);
  }

  void saveJobApply() async{
    job.saveJob = true;
    await _database.getDb().jobDao.insertItem(job);
    showToast("Apply job success", position: ToastPosition.bottom);
  }

  void backScreen() {
    navigator.pop();
  }
}