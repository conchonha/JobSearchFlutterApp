import 'package:json_annotation/json_annotation.dart';

import '../user_infor_uuid/user_info.dart';

part 'user_uuid_response.g.dart';

@JsonSerializable()
class UserUUIDResponse{
  @JsonKey(name: 'error')
  bool error;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  UserInFor userInfor;

  UserUUIDResponse(this.error, this.message, this.userInfor);

  factory UserUUIDResponse.fromJson(Map<String, dynamic> json) =>
      _$UserUUIDResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserUUIDResponseToJson(this);
}