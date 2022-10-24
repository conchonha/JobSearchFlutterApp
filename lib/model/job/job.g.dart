// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      json['id'] as int,
      json['Name'] as String,
      (json['BaseSalary'] as num).toDouble(),
      json['Amount'] as int,
      json['Gender'] as int,
      json['Age'] as String,
      json['EnglishLevel'] as int,
      json['Experience'] as String,
      json['OtherRequirements'] as String,
      json['icon'] as String,
      json['CareerId'] as int,
      json['areaId'] as int,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'Name': instance.title,
      'BaseSalary': instance.price,
      'Amount': instance.amount,
      'Gender': instance.gender,
      'Age': instance.age,
      'EnglishLevel': instance.englishLevel,
      'Experience': instance.experience,
      'OtherRequirements': instance.description,
      'icon': instance.icon,
      'CareerId': instance.careerId,
      'areaId': instance.areaId,
    };
