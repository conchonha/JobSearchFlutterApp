// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_uuid_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUUIDInfo _$UserUUIDInfoFromJson(Map<String, dynamic> json) => UserUUIDInfo(
      json['_id'] as String,
      json['account'] as String,
      json['authenHash'] as String?,
      json['created_at'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$UserUUIDInfoToJson(UserUUIDInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'account': instance.userName,
      'authenHash': instance.password,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
