// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['uuid'] as String,
      json['Name'] as String,
      json['Email'] as String,
      age: json['Age'] as int?,
      yearOfBirth: json['YearOfBirth'] as int?,
      gender: json['Gender'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'Name': instance.name,
      'Email': instance.email,
      'Age': instance.age,
      'YearOfBirth': instance.yearOfBirth,
      'Gender': instance.gender,
    };
