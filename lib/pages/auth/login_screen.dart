import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/pages/auth/user_viewmodel.dart';
import 'package:untitled_folder/res/app_color.dart';
import 'package:untitled_folder/res/app_style.dart';
import 'package:provider/provider.dart';

import '../../res/contains.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<UserViewModel>(
        viewmodel: UserViewModel(),
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 230,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(950, 150)),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.only(bottom: AppDP.dp_10),
                      decoration: const BoxDecoration(
                        color: AppColor.backgroundcolor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(1150, 160)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            Drawable.img_wellcom,
                            width: AppDP.dp_80,
                            height: AppDP.dp_80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: AppDP.dp_30,
                          ),
                          Text(
                            'Hi Login',
                            style:
                                AppStyle.title?.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppDP.dp_30,
              ),
              Expanded(
                  child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<UserViewModel>(
                        builder: (_, model, child) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDP.dp_30),
                          child: Form(
                            key: model.formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: model.height,
                                  child: TextFormField(
                                    controller: model.nameController,
                                    validator: model.validateUserName,
                                    keyboardType: TextInputType.emailAddress,
                                    style: AppStyle.small,
                                    decoration:
                                        AppStyle.textFielInputDecoration(
                                            "Tên Đăng Nhập"),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppDP.dp_30,
                                ),
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    SizedBox(
                                      height: model.height,
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        validator: model.validatePassword,
                                        controller: model.passController,
                                        keyboardType: TextInputType.text,
                                        obscureText: !model.checkShowPass,
                                        style: AppStyle.small,
                                        decoration:
                                            AppStyle.textFielInputDecoration(
                                                "Mật khẩu"),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        model.checkShowPass
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: AppDP.dp_16,
                                      ),
                                      onPressed: () {
                                        model.checkShowPassWord();
                                      },
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppDP.dp_0, top: AppDP.dp_20),
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurple,
                                        hoverColor: Colors.deepPurple,
                                        value: model.isPrefsLogin,
                                        onChanged: model.checkSaveUser,
                                      ),
                                      Text(
                                        "Nhớ tài khoản",
                                        style: AppStyle.small,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSP.sp_30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: AppDP.dp_30, right: AppDP.dp_30),
                        height: AppDP.dp_40,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppDP.dp_30)),
                          child: Consumer<UserViewModel>(
                            builder: (_, vm, child) => MaterialButton(
                              color: Colors.deepPurple,
                              onPressed: vm.login,
                              elevation: AppDP.dp_5,
                              height: AppDP.dp_50,
                              hoverColor: Colors.blue,
                              minWidth: MediaQuery.of(context).size.width * 0.9,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: AppStyle.small
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppDP.dp_50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            Drawable.icon_facebook,
                            width: AppDP.dp_25,
                            height: AppDP.dp_25,
                          ),
                          const SizedBox(
                            width: AppDP.dp_20,
                          ),
                          Container(
                            width: AppDP.dp_1,
                            height: AppDP.dp_50,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: AppDP.dp_20,
                          ),
                          GestureDetector(
                            onTap: () {
                              //----------------------------------Sign In
                            },
                            child: Image.asset(
                              Drawable.icon_google,
                              width: AppDP.dp_25,
                              height: AppDP.dp_25,
                              color: Colors.red,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppDP.dp_30,
                      ),
                      Container(
                          alignment: Alignment.bottomCenter,
                          child: Consumer<UserViewModel>(
                            builder: (_, model, child) => GestureDetector(
                              onTap: model.onTapRegister,
                              child: Text(
                                "Register",
                                style: AppStyle.title
                                    ?.copyWith(color: AppColor.backgroundcolor),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
