import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'height')
  int? height;

  @JsonKey(name: 'weight')
  int? weight;

  @JsonKey(name: 'Experience')
  String? experience;

  @JsonKey(name: 'SchoolsName')
  String? schoolsName;

  @JsonKey(name: 'ProofLetter')
  String? proofLetter;

  @JsonKey(name: 'Interests')
  String? interests;

  @JsonKey(name: 'HomeTown')
  String? homeTown;

  @JsonKey(name: 'EducationLevel')
  String? educationLevel;

  @JsonKey(name: 'CareerAspirations')
  int careerAspirations;

  @JsonKey(name: 'SpecialConditions')
  String? specialConditions;

  @JsonKey(name: 'Salary')
  double? salary;

  @JsonKey(name: 'JobInformation')
  String? jobInformation;

  @JsonKey(name: 'areaId')
  int areaId;

  Profile(this.uuid, this.height, this.weight, this.experience,
      this.schoolsName, this.proofLetter, this.interests, this.homeTown,
      this.educationLevel, this.careerAspirations, this.specialConditions,
      this.salary, this.jobInformation, this.areaId);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}