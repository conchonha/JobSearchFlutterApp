import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:untitled_folder/model/area/area.dart';
import 'package:untitled_folder/model/career/career.dart';
import 'package:untitled_folder/model/data/data_provider.dart';
import 'package:untitled_folder/model/profile/profile.dart';
import 'package:untitled_folder/model/profile_data.dart';
import 'package:untitled_folder/model/response/home/response_data.dart';
import 'package:untitled_folder/res/contains.dart';

import '../../component/profile/profile_widget.dart';
import '../../model/user/user.dart';
import '../../services/api_services.dart';
import '../../utils/locator_getit.dart';

class ProfileViewModel extends BaseVM {
  final _api = locator<Api>();
  final _dataProvider = DataProvider();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _experienceController = TextEditingController();
  final _schoolsNameController = TextEditingController();
  final _proofLetterController = TextEditingController();
  final _interestsController = TextEditingController();
  final _homeTownController = TextEditingController();
  final _educationLevelController = TextEditingController();
  final _specialConditionsController = TextEditingController();
  final _salaryController = TextEditingController();
  final _jobInformationController = TextEditingController();

  final List<ProfileData> _listItem = [];
  User? userInFor;

  final List<Career> _listCareer = [];
  final List<String> _listCareerDrop = ["Career Aspirations"];

  final List<Area> _listArea = [];
  final List<String> _listAreaDrop = ["Area"];

  listenerSteam() {
    addStreamListener<List<Career>>(_dataProvider.listCareerStream, (p0) {
      _listCareer.addAll(p0);
      p0.forEach((element) {
        _listCareerDrop.add(element.title);
      });
      notifyListeners();
    });

    callApi<ResponseData<Area>>(_api.client.getListArea(), (p0) {
      _listArea.addAll(p0.data);
      p0.data.forEach((element) {
        _listAreaDrop.add(element.name);
      });
      notifyListeners();
    });
  }

  initValue() {
    userInFor = sharedPrefs.getObject<User>(User.fromJson, Constants.KEY_USER);

    _listItem.addAll([
      ProfileData(_heightController, "Enter Height", "Height:",
          textInputType: TextInputType.number),
      ProfileData(_weightController, "Enter Weight", "Weight",
          textInputType: TextInputType.number),
      ProfileData(_experienceController, "Enter Experience", "Experience:"),
      ProfileData(
          _schoolsNameController, "Enter Schools Name", "Schools Name:"),
      ProfileData(_proofLetterController, "Enter Proof Letter", "Proof Letter:",
          textInputType: TextInputType.number),
      ProfileData(_interestsController, "Enter Interest", "Interest:"),
      ProfileData(_homeTownController, "Enter Home Town", "Home Town:"),
      ProfileData(_educationLevelController, "Enter Education Level",
          "Education Level:"),
      ProfileData(_specialConditionsController, "Enter Special Conditions",
          "Special Conditions"),
      ProfileData(_salaryController, "Enter Salary", "Salary:",
          textInputType: TextInputType.number),
      ProfileData(_jobInformationController, "Enter Job Information",
          "Job Information:"),
      ProfileData.TypeDrop((value) {
        _areaDropDownChangeValue(value);
        return _listAreaDrop;
      }, "Area"),
      ProfileData.TypeDrop((value) {
        _careerDropDownChange(value);
        return _listCareerDrop;
      }, "Career Aspirations"),
    ]);

    notifyListeners();
  }

  List<Widget> get listItems => _listItem.map((e) {
        if (e.type == ProfileDataType.TYPE_NORMAL) {
          return ProfileWidget(
            controller: e.controller,
            hintText: e.hintText,
            nameEnd: e.nameEnd,
            textInputType: e.textInputType,
          );
        }
        debugPrint("item drop called: ");
        return ProfileWidget.DropDownItem(e.listDrop, e.nameEnd);
      }).toList();

  @override
  void onInit() {
    initValue();
    listenerSteam();
  }

  void _careerDropDownChange(String? value) {
    debugPrint("careerDropDownChange value: $value");
    _listCareer.forEach((element) {
      if (value == element.title) {
        sharedPrefs.push(key: Constants.KEY_PROFILE_CAREER, value: element);
      }
    });
  }

  void updateProfile() {
    debugPrint("updateProfile called start()");
    final profile = Profile(
        "${userInFor?.uuid}",
        int.tryParse(_heightController.text.trim()),
        int.tryParse(_weightController.text.trim()),
        _experienceController.text,
        _schoolsNameController.text,
        _proofLetterController.text,
        _interestsController.text,
        _homeTownController.text,
        _educationLevelController.text,
        sharedPrefs
                .getObject<Career>(Career.fromJson, Constants.KEY_PROFILE_CAREER)
                ?.id ??
            1,
        _specialConditionsController.text,
        double.tryParse(_salaryController.text.trim()),
        _jobInformationController.text,
        sharedPrefs.getObject<Area>(Area.fromJson, Constants.KEY_PROFILE_AREA)?.id ??
            1);

    callApi<ResponseData<Profile>>(
        _api.client.registerProfile(profile), (p0) {
          debugPrint("updateProfile success: $p0");
          sharedPrefs.push(key: Constants.KEY_PROFILE, value: p0.data[0]);
    });
  }

  void _areaDropDownChangeValue(String? value) {
    debugPrint("_areaDropDownChangeValue value: $value");
    _listArea.forEach((element) {
      if (value == element.name) {
        sharedPrefs.push(key: Constants.KEY_PROFILE_AREA, value: element);
      }
    });
  }
}
