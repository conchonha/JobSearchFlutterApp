// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Career _$CareerFromJson(Map<String, dynamic> json) => Career(
      json['id'] as int,
      json['Name'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$CareerToJson(Career instance) => <String, dynamic>{
      'id': instance.id,
      'Name': instance.title,
      'icon': instance.icon,
    };
