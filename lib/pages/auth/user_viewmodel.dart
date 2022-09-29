import 'package:flutter/cupertino.dart';
import 'package:flutter_library/base/base_vm.dart';
import 'package:flutter_library/utils/ValidateUtil.dart';
import 'package:untitled_folder/utils/routers.dart';

class UserViewModel extends BaseVM{
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool checkShowPass = false;
  bool? isPrefsLogin = false;


  @override
  void onInit() {
  }

  void checkShowPassWord() {
    checkShowPass = !checkShowPass;
    notifyListeners();
  }

  void checkSaveUser(bool? value){
    isPrefsLogin = value;
    notifyListeners();
  }

  String? validatePassword(String? value) => ValidateUtil.isPassUser(value)
      ? null
      : "Mật khẩu không đúng định dạng";

  String? validateUserName(String? value) => ValidateUtil.isNameUser(value)
      ? null
      : "Tên tài khoản không đúng định dạng";

  onTapRegister(){
    checkShowPass = false;
    navigator.pushName(RouterName.signup_screen);
    notifyListeners();
  }

  onBackScreen(){
    navigator.pop();
  }
}