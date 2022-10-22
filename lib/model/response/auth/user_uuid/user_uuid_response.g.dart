// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_uuid_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUUIDResponse _$UserUUIDResponseFromJson(Map<String, dynamic> json) =>
    UserUUIDResponse(
      json['error'] as bool,
      json['message'] as String,
      UserInFor.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUUIDResponseToJson(UserUUIDResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.userInfor,
    };
