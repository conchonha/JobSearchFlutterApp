import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'Name')
  String name;

  @JsonKey(name: 'Email')
  String email;

  @JsonKey(name: 'Age')
  int? age = 0;

  @JsonKey(name: 'YearOfBirth')
  int? yearOfBirth = 0;

  @JsonKey(name: 'Gender')
  int? gender = 0;

  User(this.uuid, this.name,this.email,{this.age, this.yearOfBirth, this.gender});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}