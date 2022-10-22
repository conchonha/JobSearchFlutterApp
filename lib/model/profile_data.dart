import 'package:flutter/cupertino.dart';

typedef callbackDrop = List<String> Function(String?);

class ProfileData{
  final TextEditingController? controller;
  final String? hintText;
  final String? nameEnd;
  final ProfileDataType? type;
  final callbackDrop? listDrop;
  final TextInputType? textInputType;

  ProfileData(this.controller, this.hintText, this.nameEnd,{this.type = ProfileDataType.TYPE_NORMAL,this.listDrop,this.textInputType = TextInputType.name});

  ProfileData.TypeDrop(this.listDrop,this.nameEnd,{this.type = ProfileDataType.TYPE_DROP, this.controller, this.hintText,this.textInputType});
}

enum ProfileDataType{
  TYPE_NORMAL,
  TYPE_DROP
}