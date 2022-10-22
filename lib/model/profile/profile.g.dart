// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      json['uuid'] as String,
      json['height'] as int?,
      json['weight'] as int?,
      json['Experience'] as String?,
      json['SchoolsName'] as String?,
      json['ProofLetter'] as String?,
      json['Interests'] as String?,
      json['HomeTown'] as String?,
      json['EducationLevel'] as String?,
      json['CareerAspirations'] as int,
      json['SpecialConditions'] as String?,
      (json['Salary'] as num?)?.toDouble(),
      json['JobInformation'] as String?,
      json['areaId'] as int,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'height': instance.height,
      'weight': instance.weight,
      'Experience': instance.experience,
      'SchoolsName': instance.schoolsName,
      'ProofLetter': instance.proofLetter,
      'Interests': instance.interests,
      'HomeTown': instance.homeTown,
      'EducationLevel': instance.educationLevel,
      'CareerAspirations': instance.careerAspirations,
      'SpecialConditions': instance.specialConditions,
      'Salary': instance.salary,
      'JobInformation': instance.jobInformation,
      'areaId': instance.areaId,
    };
