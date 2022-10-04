import 'package:flutter/material.dart';
import 'package:flutter_library/base/base_widget.dart';
import 'package:untitled_folder/pages/setting/setting_viewmodel.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingViewModel>(
        viewmodel: SettingViewModel(), child: Container());
  }
}
