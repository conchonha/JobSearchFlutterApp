import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled_folder/pages/profile/profile_viewmodel.dart';
import 'package:untitled_folder/res/app_color.dart';
import 'package:untitled_folder/res/app_style.dart';
import 'package:untitled_folder/res/contains.dart' as Drawable;

import '../../component/profile/large_appbar.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProfileViewModel>(
        viewmodel: ProfileViewModel(),
        child: Scaffold(
          appBar: largeAppbar(
            colors: AppColor.whiteColor,
              childLeading: Consumer<ProfileViewModel>(
                builder: (_, vm, child) => IconButton(
                  onPressed: vm.backProfileScreen,
                  icon: SvgPicture.asset(
                    Drawable.Drawable.ic_layer_left,
                    width: AppDP.dp_6,
                    height: AppDP.dp_11,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              title: "Hồ Sơ Người Dùng",
              ),
          body: SingleChildScrollView(
            child: _getContent,
          ),
        ));
  }

  Widget get _getContent => Consumer<ProfileViewModel>(
        builder: (context, model, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: AppDP.dp_187,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: model.getAvatarPath != null? FileImage(File(model.getAvatarPath!)) : null,
                      radius: 50,
                      backgroundColor: Colors.black,
                    ),
                    const SizedBox(
                      height: AppDP.dp_8,
                    ),
                    Text(
                      "${model.userInFor?.name}",
                      style: AppStyle.title,
                    ),
                    const SizedBox(
                      height: AppDP.dp_3,
                    ),
                    Text(
                      "${model.userInFor?.email}",
                      style: AppStyle.medium,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: AppDP.dp_24,
              ),
              ...model.listItems,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: MaterialButton(
                    color: Colors.deepPurple,
                    onPressed: (){
                      model.updateProfile();
                    },
                    elevation: AppDP.dp_5,
                    height: AppDP.dp_50,
                    hoverColor: Colors.blue,
                    child: Center(
                      child: Text(
                        "Cập nhật thông tin",
                        style: AppStyle.small
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      );
}
