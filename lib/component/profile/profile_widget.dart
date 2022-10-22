import 'package:flutter/material.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/res/app_style.dart';

import '../../model/profile_data.dart';
import 'drop_item.dart';

class ProfileWidget extends StatelessWidget {
 final TextEditingController? controller;
 final String? hintText;
 final String? nameEnd;
 final callbackDrop? callback;
 final TextInputType? textInputType;

  const ProfileWidget({Key? key,this.controller,this.hintText, this.nameEnd,this.callback,this.textInputType = TextInputType.name}) : super(key: key);

 const ProfileWidget.DropDownItem(this.callback,[this.nameEnd,Key? key,this.controller, this.hintText,this.textInputType]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDP.dp_2),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: AppDP.dp_48,
      padding: const EdgeInsets.only(left: AppDP.dp_24, right: AppDP.dp_21),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "$nameEnd",
            style: AppStyle.medium?.copyWith(fontWeight: FontWeight.bold)
          ),
          SizedBox(
            width: AppDP.dp_100,
            child: callback != null? DropDownItem(callback) : TextFormField(
              controller: controller,
              keyboardType: textInputType,
              textAlign: TextAlign.center,
              style: AppStyle.medium?.copyWith(fontSize: AppSP.sp_9),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppStyle.medium?.copyWith(fontSize: AppSP.sp_9)
              ),
            ),
          )
        ],
      ),
    );
  }
}
