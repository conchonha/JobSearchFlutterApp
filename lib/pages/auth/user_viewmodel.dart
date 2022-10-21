import 'package:flutter/cupertino.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/utils/ValidateUtil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:untitled_folder/res/contains.dart';
import 'package:untitled_folder/services/api_services.dart';
import 'package:untitled_folder/utils/routers.dart';

import '../../model/respone/auth/user/user_response.dart';
import '../../model/respone/auth/user_uuid/user_uuid_response.dart';
import '../../model/user/user.dart';
import '../../utils/locator_getit.dart';

class UserViewModel extends BaseVM {
  final _api = locator<Api>();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool checkShowPass = false;
  bool? isPrefsLogin = false;
  double height = 40;

  @override
  void onInit() {}

  void checkShowPassWord() {
    checkShowPass = !checkShowPass;
    notifyListeners();
  }

  void checkSaveAccountAndNavigate(){
    if(sharedPrefs.get<String>(Constants.KEY_USER) != null){
      navigator.pushName(RouterName.bottom_navigator_screen);
    }
  }

  void checkSaveUser(bool? value) {
    isPrefsLogin = value;
    notifyListeners();
  }

  String? validatePassword(String? value) =>
      ValidateUtil.isPassUser(value) ? null : "Mật khẩu không đúng định dạng";

  String? validateUserName(String? value) => ValidateUtil.isNameUser(value)
      ? null
      : "Tên tài khoản không đúng định dạng";

  String? validateUserEmail(String? value) =>
      ValidateUtil.isEmail(value) ? null : "E-mail không đúng định dạng";

  onTapRegister() {
    checkShowPass = false;
    navigator.pushName(RouterName.signup_screen);
    notifyListeners();
  }

  onBackScreen() {
    navigator.pop();
  }

  login() {
    if (formKey.currentState?.validate() == true) {
      callApi<UserUUIDResponse>(
          Api.clientUUID().clientUUID.loginUserUUId(
              nameController.text.trim(), passController.text.trim()), (value) {
            callApi<UseResponse>(_api.client.findUserByName(nameController.text.trim()), (user){
              navigator.pushNameAndRemoveUtil(RouterName.bottom_navigator_screen,RouterName.bottom_navigator_screen);
              if(isPrefsLogin = true){
                sharedPrefs.push(key: Constants.KEY_USER, value: user.data);
                return;
              }
              sharedPrefs.removeKey(Constants.KEY_USER);
            });

      });
    } else {
      height = 60;
      notifyListeners();
    }
  }

  void createUser() {
    if (formKey.currentState?.validate() == true) {
      callApi<UserUUIDResponse>(
          Api.clientUUID().clientUUID.createUserUUId(
              nameController.text.trim(), passController.text.trim()), (value) {
        callApi<UseResponse>(
            _api.client.register(User(
                value.userInfor.userUUIDInfo.id,
                value.userInfor.userUUIDInfo.userName,
                emailController.text.trim(),
                )), (userResponse) {
          showToast("Register success", position: ToastPosition.bottom);
          if(isPrefsLogin!){
            sharedPrefs.push(
                key: Constants.KEY_USER, value: userResponse.data);
          }
          navigator.pushNameAndRemoveUtil(RouterName.bottom_navigator_screen,
              RouterName.bottom_navigator_screen);
        });
      }, closeLoading: false);
    } else {
      height = 60;
      notifyListeners();
    }
  }
}
