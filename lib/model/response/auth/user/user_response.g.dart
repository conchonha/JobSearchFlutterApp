// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UseResponse _$UseResponseFromJson(Map<String, dynamic> json) => UseResponse(
      json['message'] as String,
      json['statuscode'] as int,
      json['total'] as int,
      User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UseResponseToJson(UseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'total': instance.total,
      'data': instance.data,
    };
