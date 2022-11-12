import 'package:flutter/material.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/res/app_style.dart';

import '../../model/profile_data.dart';
import '../../res/app_color.dart';

class DropDownItem extends StatefulWidget {
  final callbackDrop? callback;

  const DropDownItem(this.callback, {Key? key}) : super(key: key);

  @override
  State<DropDownItem> createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  String? value = "";

  @override
  void initState() {
    value = widget.callback?.call(null)[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton<String>(
      alignment: Alignment.center,
      value: "$value",
      icon: const Icon(
        Icons.arrow_drop_down,
        size: AppDP.dp_15,
        color: AppColor.blackColor,
      ),
      items: widget.callback!(null)
          .map((e) =>
          DropdownMenuItem(
            value: e,
            child: Text(e,style: AppStyle.medium?.copyWith(fontSize: AppSP.sp_9),),
          ))
          .toList(),
      onChanged: (textChange){
        setState(() {
          value = "$textChange";
        });
        widget.callback?.call(textChange);
      },
      underline: const SizedBox.shrink(),
    ),);
  }
}

