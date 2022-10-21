import 'package:json_annotation/json_annotation.dart';

part 'user_uuid_info.g.dart';

@JsonSerializable()
class UserUUIDInfo{
  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'account')
  String userName;

  @JsonKey(name: 'authenHash')
  String? password;

  @JsonKey(name: 'created_at')
  String created_at;

  @JsonKey(name: 'updated_at')
  String updated_at;

  UserUUIDInfo(
      this.id, this.userName, this.password, this.created_at, this.updated_at);

  factory UserUUIDInfo.fromJson(Map<String, dynamic> json) =>
      _$UserUUIDInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserUUIDInfoToJson(this);
}