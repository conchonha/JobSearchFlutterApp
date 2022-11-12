import 'package:flutter/material.dart';
import 'package:flutter_library/res/dimens.dart';
import 'package:untitled_folder/res/app_color.dart';
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
      margin: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
      width: MediaQuery.of(context).size.width,
      height: AppDP.dp_48,
      padding: const EdgeInsets.only(left: AppDP.dp_24, right: AppDP.dp_21),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: AppColor.grayColor9,
            blurRadius: 5,
            // Shadow position
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: callback != null? DropDownItem(callback) : TextFormField(
            controller: controller,
            keyboardType: textInputType,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.grey.shade400),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 10),
                border: InputBorder.none
            ),
          )),
          Text(
            "$nameEnd",
            style: AppStyle.medium?.copyWith(fontWeight: FontWeight.bold)
          )
        ],
      ),
    );
  }
}
