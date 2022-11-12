import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:flutter_library/base/base_widget_model.dart';
import 'package:flutter_library/utils/navigator_services.dart';
import 'package:untitled_folder/pages/setting/setting_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../model/data_display_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingViewModel>(
        viewmodel: SettingViewModel(),
        child: Scaffold(
          body: Consumer<SettingViewModel>(
            builder: (_, vm, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 7),
                  child: CircleAvatar(
                    backgroundImage: vm.getAvatarPath != null? FileImage(File(vm.getAvatarPath!)) : null,
                    radius: 50,
                    backgroundColor: Colors.black,
                  ),
                ),
                Text(
                  vm.user?.name ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    vm.user?.email ?? "",
                    style: const TextStyle(fontSize: 14, color: Colors.black26),
                  ),
                ),
                InkWell(
                  onTap: (){
                    vm.loadFileImage();
                  },
                  child: const Text(
                    "Chọn ảnh",
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
                ...vm.listItem
                    .map((e) => _ItemRow(e))
              ],
            ),
          ),
        ));
  }
}

class _ItemRow extends BaseWidgetModel<SettingViewModel>{
  DataDisplaySetting dataDisplaySetting;
  _ItemRow(this.dataDisplaySetting);

  @override
  Widget build(BuildContext context, SettingViewModel widgetModel) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          border: Border.all(
              color: Theme.of(globalKey.getCurrentContext).dividerColor,
              width: 0.5),
          color: Colors.white38),
      child: InkWell(
        onTap: () {
          widgetModel.onClickItem(dataDisplaySetting);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                width: 30,
                height: 30,
                color: dataDisplaySetting.color,
                child: Icon(
                  dataDisplaySetting.iconData,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                dataDisplaySetting.title,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.navigate_next,
                    size: 25,
                    color: Colors.black,
                  )),
            )
          ],
        ),
      ),
    );
  }
  
}

