import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/base/base_widget_model.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/pages/auth/user_viewmodel.dart';
import 'package:untitled_folder/res/app_color.dart';
import 'package:untitled_folder/res/app_style.dart';
import 'package:provider/provider.dart';

import '../../res/contains.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

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
                            'Đăng Ký Tài ',
                            style:
                                AppStyle.title?.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    _BackWidget()
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
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppDP.dp_30),
                        child: _FormRegister(),
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
                            builder: (_,vm,child) => MaterialButton(
                              color: Colors.deepPurple,
                              onPressed: () {
                                vm.createUser();
                              },
                              elevation: AppDP.dp_5,
                              height: AppDP.dp_50,
                              hoverColor: Colors.blue,
                              minWidth: MediaQuery.of(context).size.width * 0.9,
                              child: Center(
                                child: Text(
                                  "Đăng Ký",
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
                    ],
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}

class _BackWidget extends BaseWidgetModel<UserViewModel> {
  @override
  Widget build(BuildContext context, UserViewModel widgetModel) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: widgetModel.onBackScreen,
      iconSize: AppDP.dp_20,
      color: Colors.white,
      padding: EdgeInsets.zero,
    );
  }
}

class _FormRegister extends BaseWidgetModel<UserViewModel> {
  @override
  Widget build(BuildContext context, widgetModel) {
    return Form(
      key: widgetModel.formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: widgetModel.height,
            child: TextFormField(
              controller: widgetModel.nameController,
              validator: widgetModel.validateUserName,
              keyboardType: TextInputType.name,
              style: AppStyle.small,
              decoration: AppStyle.textFielInputDecoration("Tên Đăng Nhập"),
            ),
          ),
          const SizedBox(
            height: AppDP.dp_15,
          ),
          SizedBox(
            height: widgetModel.height,
            child: TextFormField(
              controller: widgetModel.emailController,
              validator: widgetModel.validateUserEmail,
              keyboardType: TextInputType.emailAddress,
              style: AppStyle.small,
              decoration: AppStyle.textFielInputDecoration("E-mail"),
            ),
          ),
          const SizedBox(
            height: AppDP.dp_15,
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              SizedBox(
                height: widgetModel.height,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  validator: widgetModel.validatePassword,
                  controller: widgetModel.passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !widgetModel.checkShowPass,
                  style: AppStyle.small,
                  decoration: AppStyle.textFielInputDecoration("Mật khẩu"),
                ),
              ),
              IconButton(
                icon: Icon(
                  widgetModel.checkShowPass
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: AppDP.dp_16,
                ),
                onPressed: () {
                  widgetModel.checkShowPassWord();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
