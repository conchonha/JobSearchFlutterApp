import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:untitled_folder/model/area/area.dart';
import 'package:untitled_folder/model/career/career.dart';
import 'package:untitled_folder/model/data/data_provider.dart';
import 'package:untitled_folder/model/profile/profile.dart';
import 'package:untitled_folder/model/profile_data.dart';
import 'package:untitled_folder/model/response/home/response_data.dart';
import 'package:untitled_folder/res/contains.dart';
import 'package:untitled_folder/utils/extension.dart';
import 'package:untitled_folder/utils/routers.dart';

import '../../component/profile/profile_widget.dart';
import '../../model/user/user.dart';
import '../../services/api_services.dart';
import '../../utils/locator_getit.dart';

class ProfileViewModel extends BaseVM {
  final _api = locator<Api>().client;
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
  Profile? _profile;
  Career? _career;
  Area? _area;

  final List<Career> _listCareer = [];
  final List<String> _listCareerDrop = ["Career Aspirations"];

  final List<Area> _listArea = [];
  final List<String> _listAreaDrop = ["Area"];

  String? get getAvatarPath => sharedPrefs.get<String>(Constants.KEY_IMAGE_AVATAR);

  void _listenerSteam() {
    addStreamListener<List<Career>>(_dataProvider.listCareerStream, (p0) {
      _listCareer.addAll(p0);
      p0.forEach((element) {
        _listCareerDrop.add(element.title);
      });
      notifyListeners();
    });

    addStreamListener<List<Area>>(_dataProvider.listAreaStream, (p0){
      _listArea.addAll(p0);
      p0.forEach((element) {
        _listAreaDrop.add(element.name);
      });
      notifyListeners();
    });
  }

  void _initValue() {
     userInFor = sharedPrefs.getObject<User>(User.fromJson, Constants.KEY_USER);
    _profile = sharedPrefs.getObject<Profile>(Profile.fromJson, Constants.KEY_PROFILE);
    _career = sharedPrefs.getObject<Career>(Career.fromJson, Constants.KEY_PROFILE_CAREER);
    _area = sharedPrefs.getObject<Area>(Area.fromJson, Constants.KEY_PROFILE_AREA);

    fechList();
    notifyListeners();
  }

  void fechList(){
    _listItem.clear();
    _listItem.addAll([
      ProfileData(_heightController,
          "Chi???u cao", _profile?.height?.toString().plush(" m") ?? "Chi???u cao",
          textInputType: TextInputType.number),
      ProfileData(_weightController,
          "C??n n???ng", _profile?.weight?.toString().plush(" Kg") ?? "C??n n???ng",
          textInputType: TextInputType.number),
      ProfileData(_experienceController,
          "Kinh nghi???m", _profile?.experience?.plush(" Year") ?? "Kinh Nghi???m",textInputType: TextInputType.number),
      ProfileData(_schoolsNameController,
          "Th??ng tin kh??c", _profile?.schoolsName?? "Th??ng tin kh??c"),
      ProfileData(_proofLetterController,
          "S??? ch???ng minh", _profile?.proofLetter?? "S??? ch???ng minh",
          textInputType: TextInputType.number),
      ProfileData(_interestsController,
          "S??? th??ch",_profile?.interests ?? "S??? th??ch"),
      ProfileData(_homeTownController,
          "Qu?? h????ng",_profile?.homeTown ?? "Qu?? h????ng"),
      ProfileData(
          _educationLevelController,
          "Tr??nh ?????",_profile?.educationLevel ?? "Tr??nh ?????"),
      ProfileData(_salaryController,
          "L????ng",_profile?.salary?.toString().plush(" Vn??") ?? "L????ng",
          textInputType: TextInputType.number),
      ProfileData(
        _jobInformationController,
        "Th??ng tin c??ng vi???c",
        _profile?.jobInformation ?? "Th??ng tin c??ng vi???c",),
      ProfileData.TypeDrop((value) {
        _areaDropDownChangeValue(value);
        return _listAreaDrop;
      }, _area?.name ?? "Ngh??? nghi???p"),
      ProfileData.TypeDrop((value) {
        _careerDropDownChange(value);
        return _listCareerDrop;
      }, _career?.title ?? "Nguy???n v???ng ngh??? nghi???p"),
      ProfileData(
          _specialConditionsController,
          "??i???u ki???n ?????c bi???t",
          _profile?.specialConditions ?? "??i???u ki???n ?????c bi???t"),
    ]);

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
    _initValue();
    _listenerSteam();
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
        _career?.id ?? 1,
        _specialConditionsController.text,
        double.tryParse(_salaryController.text.trim()),
        _jobInformationController.text,
        _area?.id ?? 1);

    callApi<ResponseData<Profile>>(_api.registerProfile(profile), (p0) {
      debugPrint("updateProfile success: $p0");
      sharedPrefs.push(key: Constants.KEY_PROFILE, value: p0.data[0]);
      _profile = p0.data[0];
      fechList();
      notifyListeners();
    });
  }

  void _areaDropDownChangeValue(String? value) async{
    debugPrint("_areaDropDownChangeValue value: $value");
    _listArea.forEach((element) {
      if (value == element.name) {
        sharedPrefs.push(key: Constants.KEY_PROFILE_AREA, value: element);
      }
    });
  }

  void backProfileScreen() {
    navigator.pop();
  }
}
