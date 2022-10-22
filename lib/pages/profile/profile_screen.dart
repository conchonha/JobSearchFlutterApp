import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled_folder/pages/profile/profile_viewmodel.dart';
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
              childLeading: Consumer<ProfileViewModel>(
                builder: (_, vm, child) => IconButton(
                  onPressed: () {
                    vm.navigator.pop();
                  },
                  icon: SvgPicture.asset(
                    Drawable.Drawable.ic_layer_left,
                    width: AppDP.dp_6,
                    height: AppDP.dp_11,
                  ),
                ),
              ),
              title: "My Profile",
              childActions: Center(
                child: Container(
                  margin: const EdgeInsets.only(right: AppDP.dp_24),
                  child: Consumer<ProfileViewModel>(
                    builder: (_, vm, child) => Material(
                      child: InkWell(
                        onTap: vm.updateProfile(),
                        child: Text(
                          "Update",
                          style: AppStyle.small,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
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
                    ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppDP.dp_50)),
                        child: Image.asset(
                          Drawable.Drawable.ic_avatar_default,
                          width: AppDP.dp_100,
                          height: AppDP.dp_100,
                          fit: BoxFit.fill,
                        )),
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
              ...model.listItems
            ],
          );
        },
      );
}
