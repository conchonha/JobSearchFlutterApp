import 'package:json_annotation/json_annotation.dart';

import '../../../user_uuid_info/user_uuid_info.dart';


part 'user_info.g.dart';

@JsonSerializable()
class UserInFor{
  @JsonKey(name: 'userInfo')
  UserUUIDInfo userUUIDInfo;

  UserInFor(this.userUUIDInfo);

  factory UserInFor.fromJson(Map<String, dynamic> json) =>
      _$UserInForFromJson(json);

  Map<String, dynamic> toJson() => _$UserInForToJson(this);
}