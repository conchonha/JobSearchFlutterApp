import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:untitled_folder/model/user/user.dart';
import 'package:untitled_folder/res/contains.dart';
import 'package:untitled_folder/utils/routers.dart';

import '../../model/data_display_setting.dart';
import '../job_storage_or_apply/job_storage_or_apply_screen.dart';
import 'package:file/file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SettingViewModel extends BaseVM {
  final listItem = [
    DataDisplaySetting(Colors.deepPurpleAccent.withAlpha(80),
        Icons.account_circle_sharp, "Hồ Sơ", TypeSetting.PROFILE),
    DataDisplaySetting(Colors.blue.withAlpha(80), Icons.app_registration,
        "Ứng Tuyển", TypeSetting.JOB_APPLY),
    DataDisplaySetting(Colors.lightGreen.withAlpha(80), Icons.save_alt,
        "Việc Đã Lưu", TypeSetting.JOB_SAVE),
    DataDisplaySetting(
        Colors.orangeAccent.withAlpha(80),
        Icons.remove_from_queue_outlined,
        "WebSite Tham Khảo",
        TypeSetting.WEB_REFERENCES),
    DataDisplaySetting(Colors.tealAccent.withAlpha(80), Icons.logout,
        "Đăng Xuất", TypeSetting.LOGOUT),
  ];

  @override
  void onInit() {}

  User? get user =>
      sharedPrefs.getObject<User>(User.fromJson, Constants.KEY_USER);

  void onClickItem(DataDisplaySetting e) {
    switch (e.type) {
      case TypeSetting.PROFILE:
        navigator.pushName(RouterName.profile_screen);
        break;
      case TypeSetting.LOGOUT:
        sharedPrefs.removeKey(Constants.KEY_USER);
        navigator.pushNameAndRemoveUtil(
            RouterName.login_screen, RouterName.login_screen);
        break;
      case TypeSetting.JOB_APPLY:
        navigator.pushName(RouterName.job_save_or_apply_screen, argument: {
          Constants.KEY_JOB_ITEM_TYPE: JobItemType.TYPE_APPLY,
          Constants.KEY_ID: null
        });
        break;
      case TypeSetting.JOB_SAVE:
        navigator.pushName(RouterName.job_save_or_apply_screen, argument: {
          Constants.KEY_JOB_ITEM_TYPE: JobItemType.TYPE_STORAGE,
          Constants.KEY_ID: null
        });
        break;
      case TypeSetting.WEB_REFERENCES:
        navigator.pushName(RouterName.WEBVIEW_CLIENT_SCREEN);
    }
  }

  Future<void> loadFileImage() async{
    // Step 1: Retrieve image from picker
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    // Step 2: Check for valid file
    if (image == null) return;

    // Step 3: Get directory where we can duplicate selected file.
    final duplicateFilePath = await getApplicationDocumentsDirectory();

    // Step 4: Copy the file to a application document directory.
    final fileName = basename(duplicateFilePath.path);
    final name = "${duplicateFilePath.path}/$fileName";

    image.saveTo(name);
    sharedPrefs.push(key: Constants.KEY_IMAGE_AVATAR, value: name);
    notifyListeners();
  }

  String? get getAvatarPath => sharedPrefs.get<String>(Constants.KEY_IMAGE_AVATAR);

}
