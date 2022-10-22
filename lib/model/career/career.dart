import 'package:flutter_library/base/common_list/common_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'career.g.dart';

@JsonSerializable()
class Career extends CommonData{
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'Name')
  String title;

  @JsonKey(name: 'icon')
  String icon;

  Career(this.id, this.title, this.icon);

  factory Career.fromJson(Map<String, dynamic> json) =>
      _$CareerFromJson(json);

  Map<String, dynamic> toJson() => _$CareerToJson(this);
}